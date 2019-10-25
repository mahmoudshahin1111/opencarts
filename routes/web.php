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

Route::group(['prefix' => \UriLocalizer::localeFromRequest(),'namespace'=>'web','middleware'=>'auth.check.guard'], function () {
    Route::get('/' ,'HomeController@index')->name('web.front');
    Route::group(['prefix'=>'login'], function () {
        Route::get('/','LoginController@index')->name('web.login');
        Route::post('/','LoginController@login');
    });
    Route::group(['prefix'=>'dashboard','middleware' => ['auth:store,supplier,customer']], function () {
        Route::get('stores','LoginController@indexStores')->name('web.stores');
        Route::get('all_stores','LoginController@getStores')->name('web.stores.all_stores');
        Route::group(['prefix'=>'store_controll_panel','middleware' => []], function () {
            Route::get('/{store_id}','StoreDashBoardController@index')->name('web.store.control_panel');
        });
        //Route::apiResource('user', 'UserController');
    });
});
