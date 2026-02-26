<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreBlogCategory extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        $rules = [];

        if ($this->isMethod('post')) {
            $rules['name'] = 'required|string|max:255|unique:blog_categories,name';
        } elseif ($this->isMethod('put') || $this->isMethod('patch')) {
            $rules['name'] = 'required|unique:blog_categories,name,'.$this->route('category');
        }

        return $rules;
    }
}
