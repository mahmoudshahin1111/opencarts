<?php

namespace App\models;

use App\Traits\HasCountry;
use App\Traits\HasStore;
use Illuminate\Database\Eloquent\Model;

class ModelShipping extends Model
{
    use ScopeWhereStore,HasCountry,HasStore;
    use SoftDeletes;
    public function shippable(){
        return $this->morphTo();
    }
   
}
