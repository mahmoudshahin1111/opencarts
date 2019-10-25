<?php
namespace App\Traits;

use Illuminate\Support\Facades\Config;

trait HasImage{
    public function getProfileImageAttribute($value){
        if(is_null($value)){
            return Config::get('defaults.default_user_images.profile_image');
        }   
        return $value;
    }
}