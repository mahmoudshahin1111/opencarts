<?php

namespace App\models;

use App\models\Package;
use App\models\Product;
use App\models\ProductCategory;
use App\Traits\ScopeWhereStore;
use App\models\Pivots\CountryPackage;
use App\models\Pivots\CountryProduct;
use Illuminate\Database\Eloquent\Model;
use App\models\Pivots\CountryProductCategory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Country extends Model
{
    use ScopeWhereStore; 
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    protected $translatableAttributes=['name','description']; 
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'countries';
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'description', 'is_active'];
    public function Products(){
        return $this->belongsToMany(Product::class,CountryProduct::class,'country_id','package_id','id','id');
    }
    public function ProductCategories(){
        return $this->belongsToMany(ProductCategory::class,CountryProductCategory::class,'country_id','package_id','id','id');
    }
    public function Packages(){
       return $this->belongsToMany(Package::class,CountryPackage::class,'country_id','package_id','id','id');
    }
}
