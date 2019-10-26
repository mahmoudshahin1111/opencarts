<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OptionCategoryUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'id'=>['exists:option_categories,id','required'],
            'name'=>['max:50','bail','required'],
            'description'=>['max:100','bail'],
            'is_active'=>['boolean'],
            'code'=>['exists:codes,code']
        ];
    }
}
