<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'prices';
        /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['currancy_id', 'value'];

    public function pricable(){
        return $this->morphTo('priceable');
    }
}
