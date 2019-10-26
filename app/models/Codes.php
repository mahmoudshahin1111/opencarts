<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Codes extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'codes';
    const CODES =[
        'IMAGE_FILE'=>'FILE_IMG',
        'COLOR'=>'COLOR'
    ];
    static function Codes($index){
       return static::CODES[$index];
    }
}
