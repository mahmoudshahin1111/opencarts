<?php

namespace App\models;

use App\models\Option;
use App\models\Country;
use App\Traits\HasCode;
use App\Traits\HasStore;
use App\Traits\ScopeWhereStore;
use App\models\Pivots\ProductOption;
use App\models\Pivots\CountryProduct;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Product extends Model
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
    protected $table = 'products';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'description', 'is_active'];
    public function Options()
    {
        return $this->belongsToMany(Option::class, ProductOption::class, 'product_id', 'option_id');
    }
    public function Countries(){
        return $this->belongsToMany(Country::class,CountryProduct::class,'country_id','product_id');
    }

}
