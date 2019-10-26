<?php

namespace App\Http\Controllers\web;

use App\User;
use App\models\Store;
use App\models\SupplierUser;
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
            if(get_class($user) == User::class||get_class($user) == SupplierUser::class){
                return Redirect::route('web.stores');
            }
            return Redirect::route('web.front');
        }
        return Redirect::route('web.login')->with('error',['message'=>trans('Not Authrized'),'title'=>trans('Auth Error')]);
    }

     /**
     * Refresh Api_Token And Logout
     *
     * @return void
     */
    public function logout(){
        Auth::logout();
        return Redirect::route('web.login');
    }
}
