<?php

namespace App\Http\Controllers\web;

use App\models\File;
use App\models\Codes;
use App\models\Price;
use App\models\Option;
use Illuminate\Http\Request;
use App\models\OptionCategory;
use App\models\ProductCategory;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Requests\OptionUpdateRequest;
use App\Http\Requests\OptionCategoryRequest;
use App\Http\Requests\OptionCategoryStoreRequest;
use App\Http\Requests\OptionCategoryUpdateRequest;

class CategoryOptionsController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($store_id)
    {
        if (request()->ajax()) {
            $option_categories = OptionCategory::whereStore($store_id)->without(['options'], 'store')->get();
            return DataTables::collection($option_categories)->make(true);
        }
        return view('admin.dashboard.product_category.index',['default_image'=>config('defaults.empty_image.defualt_category_option')]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(OptionCategoryStoreRequest $request, $store_id)
    {
        $option_category = OptionCategory::create($request->except('options') + ['store_id' => $store_id]);
        $this->storeNewOptions($request,$option_category);
        return $option_category->toJson();
    }
    public function storeNewOptions($request,$category){
        $request->validate([
            'options.*.name'=>['required'],
            'options.*.description'=>['max:100'],
            'options.*.price'=>['nullable','between:0.01,99999999.01']
        ]);
        foreach($request->input('options') as $option){
            $new_option = Option::create([
                'name'=>$option['name'],
                'description'=>$option['description']
            ]);
            $price = Price::create(['currancy_id'=>1,'value'=>$option['price']['value']]);
            $new_option->Price()->save($price);
            $category->options()->save($new_option);
        }
        return $category->toJson();
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($store_id, $id)
    {
        return OptionCategory::findOrFail($id)->toJson();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(OptionCategoryUpdateRequest $request, $store_id, $id)
    {
        $option_category = OptionCategory::find($id);
        $option_category->fill($request->except(['options','store']));
        $option_category->save();
        $this->updateExistsOptions($request,$option_category);
        return $option_category->fresh();
    }
    /**
     * Update Category Options
     *
     * @param Request $request
     * @param [type] $category
     * @return void
     */
    public function updateExistsOptions(Request $request,$category){
        $request->validate([
            'options.*.name'=>['required'],
            'options.*.description'=>[],
            'options.*.price'=>['nullable','between:0.01,99999999.01']
        ]);
        //Update Options
        foreach($request->input('options') as $option){
            if(empty($option['id']) || empty($op = Option::find($option['id']))){
                $op = Option::create([
                    'name'=>$option['name'],
                    'description'=>$option['description']
                ]);
                $price = Price::create(['currancy_id'=>1,'value'=>$option['price']['value']]);
                $op->Price()->save($price);
                $category->Options()->save($op);
            }
            else{
                $op->fill([
                    'name'=>$option['name'],
                    'description'=>$option['description']
                ]);
                $price = $op->Price;
                $price->currancy_id = $option['description'];
                $price->value = $option['price']['value'];
                $op->save();
            }
        }
        return $category;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($store_id, $id)
    {
        $option_category = OptionCategory::findOrFail($id);
        //Delete Options Prices
        foreach($option_category->options as $option){
            $option->Price()->delete();
        }
        //Delete Category
        $option_category->options()->delete();
        $option_category->delete();
        return $option_category;
    }
    /**
     * Upload Image
     *
     * @param Request $request
     * @return void
     */
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => 'required|max:2000|image'
        ]);
        $category = OptionCategory::findOrFail($request->id);
        $url =  $request->file('image')->store('/');
        $category->image()->delete();
        $file = File::create([
            'code' => OptionCategory::codes('IMAGE_FILE'),
            'name' => 'Option Category Image File',
            'url' => $url,
            'ext' => $request->file('image')->extension(),
        ]);
        $category->image()->save($file);
        return Storage::url($url);
    }
}
