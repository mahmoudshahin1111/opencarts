<?php

namespace App\Http\Controllers\web;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Response;

class LoginController extends Controller
{
    public function index(){
        return view('admin\auth\login');
    }
    public function login(Request $request){
        $cart = $request->only(['email','password']);
        if(Auth::attempt($cart,false)){
            $user = Auth::user();
            return Redirect::route('web.stores');
        }
        return Redirect::route('web.login')->with('error',['message'=>trans('Not Authrized'),'title'=>trans('Auth Error')]);
    }
    public function indexStores(Request $request){
        return \view('admin.auth.stores');
    }
    public function getStores(){
        $stores = Auth::user()->Stores;
        return Response::json(['stores'=>$stores]);
    }
}
