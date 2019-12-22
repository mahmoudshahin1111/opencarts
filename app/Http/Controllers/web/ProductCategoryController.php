<?php

namespace App\Http\Controllers\web;

use App\models\File;
use App\models\Codes;
use Illuminate\Http\Request;
use App\models\ProductCategory;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;

class ProductCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($store_id)
    {
        if (request()->ajax()) {
            $option_categories = ProductCategory::whereStore($store_id)->without(['options'], 'store')->get();
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
    public function store(Request $request,$store_id)
    {
        $category = ProductCategory::create($request->all() + ['store_id' => $store_id]);
        return $category->toJson();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($store_id,$id)
    {
        return ProductCategory::findOrFail($id)->toJson();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$store_id, $id)
    {
        $category = ProductCategory::find($id);
        $category->fill($request->except(['store']));
        $category->save();
        return Response::json(['message'=>'success']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($store_id,$id)
    {
        $category = ProductCategory::findOrFail($id);
        $category->delete();
        return Response::json(['message'=>'success']);
    }
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => 'required|max:2000|image'
        ]);
        $category = ProductCategory::findOrFail($request->id);
        $url =  $request->file('image')->store('/');
        $category->image()->delete();
        $file = File::create([
            'code' => ProductCategory::Codes('IMAGE_FILE'),
            'name' => 'Option Category Image File',
            'url' => $url,
            'ext' => $request->file('image')->extension(),
        ]);
        $category->image()->save($file);
        return Storage::url($url);
    }
}
