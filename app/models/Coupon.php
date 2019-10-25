<?php

namespace App\models;

use App\models\Store;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $table = 'coupons';
    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }
}
