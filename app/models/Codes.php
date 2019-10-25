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
    static function Codes(){
        return [
            'NP'=>'NP',
            'STORE_IMAGE_FILE_FILES'=>'SIFF',
        ];
    }
}
