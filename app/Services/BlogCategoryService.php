<?php

namespace App\Services;

use App\Http\Resources\BlogCategoryResource;
use App\Models\BlogCategory;

class BlogCategoryService
{
    /**
     * Get all FAQs based on the provided request filters.
     *
     * @param Request $request
     * @return mixed
     */
    public function get(object $request)
    {
        $rows = (new BlogCategory)->listAll($request->query('search'));

        return BlogCategoryResource::collection($rows);
    }

    public function getByUuid($uuid = null)
    {
        return BlogCategory::where('id', $uuid)->first();
    }

    public function getActive()
    {
        return BlogCategory::where('deleted',0)->get();
    }

    /**
     * Store FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogCategory
     */
    public function store(object $request, $id = NULL)
    {
        $faq = $id === null ? new BlogCategory() : BlogCategory::where('id', $id)->firstOrFail();
        $faq->name = clean($request->name);
        $faq->save();

        return $faq;
    }

    /**
     * Delete FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogCategory
     */
    public function delete($id)
    {
        return BlogCategory::where('id', $id)->update(['deleted'=>1]);
        // return BlogCategory::where('id', $id)->delete();
    } 
}