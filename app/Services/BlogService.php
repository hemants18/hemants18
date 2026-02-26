<?php

namespace App\Services;

use App\Http\Resources\BlogResource;
use App\Models\Blog;

class BlogService
{
    /**
     * Get all Blogs based on the provided request filters.
     *
     * @param Request $request
     * @return mixed
     */
    public function get(object $request)
    {
        $rows = (new Blog)->listAll($request->query('search'));

        return BlogResource::collection($rows);
    }

    public function getByUuid($uuid = null)
    {
        return Blog::where('id', $uuid)->first();
    }

    /**
     * Store Blog
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\Blog
     */
    public function store(object $request, $id = NULL)
    {
        $Blog = $id === null ? new Blog() : Blog::where('id', $id)->firstOrFail();
     
        if($request->hasFile('image')){
            $filePath = $request->file('image')->store('public/blog');
        } else {
            $filePath = $id !== null ? $Blog->image : null;
        }
        $Blog->category_id = $request->category_id;
        $Blog->author_id = $request->author_id;
        $Blog->tags = $request->tags ? json_encode(collect($request->tags)->pluck('id')->toArray()) : null;
        $Blog->title = clean($request->title);
        $Blog->content = clean($request->content);
        $Blog->meta_title = clean($request->meta_title);
        $Blog->meta_description = clean($request->meta_description);
        $Blog->meta_keywords = clean($request->meta_keywords);
        $Blog->image = $filePath;
        $Blog->published = $request->published;
        $Blog->publish_date = $request->published ? now() : null;
        $Blog->save();

        return $Blog;
    }

    /**
     * Delete Blog
     *
     * @param Request $request
     * @param string $id
     * @return \App\Models\Blog
     */
    public function delete($id)
    {
        return Blog::where('id', $id)->delete();
    }

    /**
     * FrontEnd 
     *
     * @param Request $request
     * @param string null
     * @return \App\Models\Blog
     */
    public function publishBlogs()
    {
        return Blog::with(['category:name,id'])
            ->published()
            ->whereNotNull('publish_date')
            ->where('publish_date', '<=', \Carbon\Carbon::now())
            ->latest('publish_date')
            ->limit(10)
            ->get();
    }

    public function BlogsList(object $request)
    {
        return Blog::with(['category','author'])
        ->when($request->search, function ($query) use ($request) {
            $query->where('title', 'like', '%' . $request->search . '%')
                  ->orWhereHas('category', function ($q) use ($request) {
                      $q->where('name', 'like', '%' . $request->search . '%');
                  })
                  ->orWhereHas('author', function ($q) use ($request) {
                      $q->whereRaw("CONCAT(first_name, ' ', last_name) LIKE ?", ["%{$request->search}%"]);
                      // $q->where('full_name', 'like', '%' . $request->search . '%');
                  });
        })
        ->latest('publish_date')
        ->paginate(10)
        ->withQueryString();
    }

    public function blogsDetail($slug)
    {
        return Blog::with(['category:name,id'])
            ->published()
            ->whereNotNull('publish_date')
            ->where('publish_date', '<=', \Carbon\Carbon::now())
            ->latest('publish_date')
            ->where('slug',$slug)
            ->first();
    }
}