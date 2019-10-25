<?php

namespace App\models;

use App\models\Country;
use Illuminate\Database\Eloquent\Model;

class Currancy extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'currancies';
    public function Country(){
        return $this->belongsTo(Country::class,'country_id','id');
    }
}
