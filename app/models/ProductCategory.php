<?php

namespace App\models;


use App\models\File;
use App\models\Codes;
use App\models\Store;
use App\models\Product;
use App\Traits\HasCode;
use App\Traits\ScopeWhereStore;
use App\models\Pivots\CategoryProduct;
use Illuminate\Database\Eloquent\Model;
use App\Observers\ProductCategoryObserver;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductCategory extends Model
{
    use ScopeWhereStore, HasCode;
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
    protected $fillable = ['store_id','name','description','is_active','code'];
    protected $translatableAttributes = ['name', 'description'];
    protected $with=[
        'store',
        'image'
    ];

    public function products()
    {
        return $this->hasManyThrough(Product::class, CategoryProduct::class, 'category_id', 'id', 'product_id', 'id');
    }
    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }
    public function image(){
        return $this->morphOne(File::class,'fileable');
    }
    public function setCodeAttribute($value){
        if($value){
            return $this->attributes['code'] = $value;
        }
        return $this->attributes['code'] = Codes::Codes('NORMAL');
    }
     /**
     * Get Kinds Codes
     *
     * @param string $code_name SPECIAL|NORMAL(defualt)
     * @return string
     */
    public static function codes(string $code_name){
        $CODES=[
            'SPECIAL'=>Codes::Codes('SPECIAL'),
            'IMAGE_FILE'=>Codes::Codes('IMAGE_FILE'),
        ];
        return $CODES[$code_name];
    }
}
