<?php

namespace App\models;

use App\models\Price;
use App\models\Country;
use App\models\Product;
use App\Traits\HasCode;
use App\Traits\HasStore;
use App\Traits\ScopeWhereStore;
use App\models\Pivots\CountryPackage;
use App\models\Pivots\PackageProduct;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Package extends Model
{
    use ScopeWhereStore; 
    use HasCode;
    use HasStore;
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    protected $translatableAttributes = ['name', 'description'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'packages';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['store_id', 'name', 'description', 'is_active'];

    public function Products()
    {
        return $this->belongsToMany(Product::class, PackageProduct::class, 'product_id', 'package_id');
    }
    public function Country()
    {
        return $this->belongsToMany(Country::class, CountryPackage::class, 'package_id', 'country_id');
    }
    public function Prices()
    {
        return $this->morphMany(Price::class,'priceable');
    }
}
