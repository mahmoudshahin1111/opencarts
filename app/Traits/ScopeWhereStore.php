<?php
namespace App\Traits;

use Illuminate\Database\Eloquent\Builder;

trait ScopeWhereStore{
    public function scopeWhereStore(Builder $query,$store_id){
        return $query->where('store_id',$store_id);
    } 
}