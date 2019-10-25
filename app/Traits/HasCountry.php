<?php
namespace App\Traits;

use App\models\Country;

trait HasCountry{
    public function country(){
        return $this->belongsTo(Country::class,'store_id','id');
    }
}