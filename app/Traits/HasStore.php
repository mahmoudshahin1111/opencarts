<?php
namespace App\Traits;

trait HasStore{
    public function country(){
        return $this->belongsTo(Store::class,'store_id','id');
    }
}