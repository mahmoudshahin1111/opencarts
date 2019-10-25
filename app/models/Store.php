<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Store extends Model
{
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    protected $translatableAttributes = ['name', 'description'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stores';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'description', 'is_active'];
    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['controlPanelUrl'];
    public function getControlPanelUrlAttribute(){
        return route('web.store.control_panel',['store_id'=>$this->id]);
    }
}
