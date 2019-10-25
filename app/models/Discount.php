<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    protected $table="discounts";
    public function discountable(){
        return $this->morphTo();
    }
}
