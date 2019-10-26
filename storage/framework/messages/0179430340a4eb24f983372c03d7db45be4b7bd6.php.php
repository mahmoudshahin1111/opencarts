<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Response;

class LoginController extends Controller
{
    /**
     * Login
     */
    public function login(LoginRequest $request){
        $cart = $request->only(['email','password']);
        if(Auth::attempt($cart,false)){
            $user = Auth::user();
            return Response::json(['api_token'=>Auth::user()->refreshApiToken(),'permissions'=>$user->permissions()->pluck('name')]);
        }
        return Response::json(['errors'=>['unauthed'=>trans('Unauthnticated')]],404);
    }
    /**
     * Refresh Api_Token And Logout
     *
     * @return void
     */
    public function logout(){
        Auth::user()->refreshApiToken();
        Auth::logout();
    }
}
