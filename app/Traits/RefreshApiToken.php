<?php
namespace App\Traits;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

trait RefreshApiToken{
    public function refreshApiToken(){
        $this->api_token = Hash::make(Str::random(20));
        $this->save();
        return $this->api_token;
    } 
    public function getApiTokenAttribute($value){
        if(empty($value)){
            return $this->refreshApiToken();
        }
        return $value;
    }
}