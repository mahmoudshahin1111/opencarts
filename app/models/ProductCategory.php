<?php

namespace App\models;

use App\models\Store;
use App\models\Product;
use App\models\Pivots\CategoryProduct;
use HasCode;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use ScopeWhereStore,HasCode; 
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'product_categories';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'description', 'is_active'];
    protected $translatableAttributes = ['name', 'description'];
    public function products()
    {
        return $this->hasManyThrough(Product::class, CategoryProduct::class, 'category_id', 'id', 'product_id', 'id');
    }
    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }
}
