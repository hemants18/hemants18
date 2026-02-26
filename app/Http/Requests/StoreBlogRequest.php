<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreBlogRequest extends FormRequest
{
    /**
     * Determine if the user is authorized
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Validation Rules
     */
    public function rules(): array
    {
        $rules = [];

        if ($this->isMethod('post')) {

            $rules = [

                'title' => 'required|string|max:255',

                'content' => 'required|string',

                'author_id' => 'required|exists:blog_authors,id',
                'category_id' => 'required|exists:blog_categories,id',

                // 'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

                'tags' => 'nullable|array',

                'tags.*.name' => 'nullable|string|max:50',

                'published' => 'required',

                'meta_title' => 'nullable|string|max:255',

                'meta_description' => 'nullable|string|max:500',

                'meta_keywords' => 'nullable|string|max:255'

            ];

        } elseif ($this->isMethod('put') || $this->isMethod('patch')) {

            $rules = [

                'title' => 'required|string|max:255',

                'content' => 'required|string',

                'author_id' => 'required|exists:blog_authors,id',
                'category_id' => 'required|exists:blog_categories,id',

                // 'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

                'tags' => 'nullable|array',

                'tags.*.name' => 'nullable|string|max:50',

                'published' => 'required',

                'meta_title' => 'nullable|string|max:255',

                'meta_description' => 'nullable|string|max:500',

                'meta_keywords' => 'nullable|string|max:255'

            ];

        }

        return $rules;
    }
}
