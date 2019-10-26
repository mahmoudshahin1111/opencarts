<?php

namespace App\Http\Controllers\web;

use Illuminate\Http\Request;
use App\models\OptionCategory;
use App\Http\Controllers\Controller;
use App\Http\Requests\OptionCategoryRequest;
use App\Http\Requests\OptionCategoryStoreRequest;
use App\Http\Requests\OptionCategoryUpdateRequest;
use App\models\Codes;
use App\models\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;

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
        return view('admin.dashboard.option_category.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(OptionCategoryStoreRequest $request, $store_id)
    {
        $option_category = OptionCategory::create($request->all() + ['store_id' => $store_id]);
        return $option_category->toJson();
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
        $option_category->fill($request->all());
        $option_category->save();
        return $option_category->toJson();
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
        $option_category->delete();
        return $option_category;
    }
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => 'required|max:2000|image'
        ]);
        $option_category = OptionCategory::findOrFail($request->id);
        $url =  $request->file('image')->store('/');
        $option_category->image()->delete();
        $file = File::create([
            'code' => Codes::Codes('IMAGE_FILE'),
            'name' => 'Option Category Image File',
            'url' => $url,
            'ext' => $request->file('image')->extension(),
            'url' => $url,
        ]);
        $option_category->image()->save($file);
        return Storage::url($url);
    }
}
