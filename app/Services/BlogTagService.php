<?php

namespace App\Services;

use App\Http\Resources\BlogTagResource;
use App\Models\BlogTag;

class BlogTagService
{
    /**
     * Get all FAQs based on the provided request filters.
     *
     * @param Request $request
     * @return mixed
     */
    public function get(object $request)
    {
        $rows = (new BlogTag)->listAll($request->query('search'));

        return BlogTagResource::collection($rows);
    }

    public function getByUuid($uuid = null)
    {
        return BlogTag::where('id', $uuid)->first();
    }

    public function getActive()
    {
        return BlogTag::where('deleted',0)->get();
    }

    /**
     * Store FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogTag
     */
    public function store(object $request, $id = NULL)
    {
        $Tag = $id === null ? new BlogTag() : BlogTag::where('id', $id)->firstOrFail();
        $Tag->name = clean($request->name);
        $Tag->save();

        return $Tag;
    }

    /**
     * Delete FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogTag
     */
    public function delete($id)
    {
        return BlogTag::where('id', $id)->update(['deleted'=>1]);
        // return BlogTag::where('id', $id)->delete();
    } 
}