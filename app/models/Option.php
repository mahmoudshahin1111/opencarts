<?php

namespace App\models;

use App\models\Store;
use App\models\Product;
use App\Scopes\WhereStoreScope;
use App\Traits\ScopeWhereStore;
use App\models\Pivots\ProductOption;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Option extends Model
{
    use ScopeWhereStore;
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    protected $translatableAttributes = ['name', 'description'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'options';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $with = ['price','products','store'];
    protected $fillable = ['name','description','is_active'];
    public function Products (){
        return $this->belongsToMany(Product::class,ProductOption::class,'option_id','product_id');
    }
    public function Store (){
        return $this->belongsTo(Store::class,'store_id','id');
    }
    public function Price(){
        return $this->morphOne(Price::class,'priceable');
    }
}
