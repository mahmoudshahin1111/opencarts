<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\models\CustomerUser;
use App\models\SupplierUser;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function registerStore(RegisterRequest $request){
        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ])->toJson();
    }
    public function registerCustomer(RegisterRequest $request){
        return CustomerUser::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ])->toJson();
    }
    public function registerSupplier(RegisterRequest $request){
        return SupplierUser::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ])->toJson();
    }
}
