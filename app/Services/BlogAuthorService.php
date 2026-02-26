<?php

namespace App\Services;

use App\Http\Resources\BlogAuthorResource;
use App\Models\BlogAuthor;

class BlogAuthorService
{
    /**
     * Get all FAQs based on the provided request filters.
     *
     * @param Request $request
     * @return mixed
     */
    public function get(object $request)
    {
        $rows = (new BlogAuthor)->listAll($request->query('search'));

        return BlogAuthorResource::collection($rows);
    }

    public function getByUuid($uuid = null)
    {
        return BlogAuthor::where('id', $uuid)->first();
    }

    public function getActive()
    {
        return BlogAuthor::where('deleted',0)->get();
    }

    /**
     * Store FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogAuthor
     */
    public function store(object $request, $id = NULL)
    {
        $Author = $id === null ? new BlogAuthor() : BlogAuthor::where('id', $id)->firstOrFail();
        $Author->first_name = clean($request->first_name);
        $Author->last_name = clean($request->last_name);
        $Author->bio = clean($request->bio);
        
        $Author->save();

        return $Author;
    }

    /**
     * Delete FAQ
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\BlogAuthor
     */
    public function delete($id)
    {
        return BlogAuthor::where('id', $id)->update(['deleted'=>1]);
        // return BlogAuthor::where('id', $id)->delete();
    } 
}