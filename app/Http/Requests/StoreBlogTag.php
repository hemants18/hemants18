<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreBlogTag extends FormRequest
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
            $rules['name'] = 'required|string|max:255|unique:blog_tags,name';
        } elseif ($this->isMethod('put') || $this->isMethod('patch')) {
            $rules['name'] = 'required|unique:blog_tags,name,'.$this->route('tag');
        }

        return $rules;
    }
}
