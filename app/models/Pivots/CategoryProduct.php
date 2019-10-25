<?php

namespace App\models\Pivots;

use Illuminate\Database\Eloquent\Model;

class CategoryProduct extends Model
{
    use \Waavi\Translation\Traits\Translatable;
    use SoftDeletes;
    protected $translatableAttributes=['name','description']; 
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'category_products';
    public function Products(){
    
    }
}
