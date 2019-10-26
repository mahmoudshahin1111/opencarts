<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class File extends Model
{
    protected $table="files";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['url','ext','code','name'];
    public function fileable(){
        return $this->morphTo();
    }
    public function getUrlAttribute($value){
        return Storage::url($value);
    }
}
