<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    protected $table="files";
    public function fileable(){
        return $this->morphTo();
    }
}
