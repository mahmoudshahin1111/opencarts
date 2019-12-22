<?php

namespace App\models;

use App\models\Store;
use App\models\Option;
use App\Traits\HasCode;
use App\Traits\HasStore;
use App\Traits\ScopeWhereStore;
use App\models\pivots\CategoryOption;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class OptionCategory extends Model
{
    use ScopeWhereStore;
    use HasStore;
    use SoftDeletes;
    use \Waavi\Translation\Traits\Translatable;
    protected $translatableAttributes = ['name', 'description'];
    protected $fillable=[
        'store_id','name','description','is_active','code'
    ];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'option_categories';
    protected $with=[
        'options',
        'store',
        'image'
    ];
    /**
     * Get Kinds Codes
     *
     * @param string $code_name COLOR|NORMAL(defualt)
     * @return string
     */
    public static function codes(string $code_name){
        $CODES=[
            'COLOR'=>Codes::Codes('COLOR'),
            'IMAGE_FILE'=>Codes::Codes('IMAGE_FILE'),
        ];
        try{
            return $CODES[$code_name];
        }catch(Exception $e){
            report($e);
        }
    }
    /** Relations */
    public function options(){
        return $this->belongsToMany(Option::class,CategoryOption::class,'option_category_id','option_id');
    }
    public function store(){
        return $this->belongsTo(Store::class,'store_id','id');
    }
    public function image(){
        return $this->morphOne(File::class,'fileable');
    }
    /**
     * Defualt Code Set
     *
     * @param [type] $value New Value [NORMAL](defualt)
     * @return void
     */
    public function setCodeAttribute($value){
        if($value){
            return $this->attributes['code'] = $value;
        }
        return $this->attributes['code'] = Codes::Codes('NORMAL');
    }
}
