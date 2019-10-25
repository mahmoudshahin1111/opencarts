<?php

use App\User;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */
Route::group(['prefix' => \UriLocalizer::localeFromRequest(),'namespace'=>'api','middleware'=>'auth.check.guard'], function () {
    //Login And Return Token With Expired after 2 days
    Route::post('login', ['as'=>'api.login','uses'=>'LoginController@login']);
    
    Route::group(['middleware' => ['auth:store_api,supplier_api,customer_api']], function () {
        /**
         * Test Auth Route
         */
        Route::get('auth_test', function () {
            dd(Auth::user());
        });

    });
});
