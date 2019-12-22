<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;
Broadcast::routes();
Route::group(['prefix' => \UriLocalizer::localeFromRequest(),'namespace'=>'web','middleware'=>'auth.check.guard'], function () {
    Route::get('/' ,'HomeController@index')->name('web.front');
    Route::get('/logout','LoginController@logout')->name('web.logout');


    Route::group(['prefix'=>'login'], function () {
        Route::get('/','LoginController@index')->name('web.login');
        Route::post('/','LoginController@login');
    });


    Route::group(['prefix'=>'dashboard','middleware' => ['auth:store,supplier,customer']], function () {
        Route::get('stores','StoreDashBoardController@indexStores')->name('web.stores');
        Route::get('all_stores','StoreDashBoardController@getStores')->name('web.stores.all_stores');
        Route::group(['prefix'=>'store_controll_panel/{store_id}','middleware' => ['store.register']], function () {
            Route::get('/','StoreDashBoardController@index')->name('web.store.control_panel');
            /** Option Category */
            Route::post('/option_category/upload',['as'=>'web.option_category.upload','uses'=>'CategoryOptionsController@uploadImage']);
            Route::apiResource('/option_category','CategoryOptionsController');
            /** End Option Category */
            /** Product */
            Route::post('/product_category/upload',['as'=>'web.product_category.upload','uses'=>'ProductCategoryController@uploadImage']);
            Route::apiResource('/product_category','ProductCategoryController');
            /** End Product */
        });
    });
});
