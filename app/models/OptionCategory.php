<?php

namespace App\models;

use App\models\Store;
use App\models\Option;
use App\Traits\HasCode;
use App\Traits\HasStore;
use App\Traits\ScopeWhereStore;
use App\models\pivots\CategoryOption;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OptionCategory extends Model
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
    protected $table = 'option_categories';
    public function options(){
        return $this->belongsToMany(Option::class,CategoryOption::class,'option_category_id','option_id');
    }
    public function store(){
        return $this->belongsTo(Store::class,'store_id','id');
    }
}
