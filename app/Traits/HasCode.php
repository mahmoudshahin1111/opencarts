<?php
namespace App\Traits;

use App\models\Codes;

trait HasCode{
    public function code(){
        return $this->belongsTo(Codes::class,'code_id','id');
    }
}
