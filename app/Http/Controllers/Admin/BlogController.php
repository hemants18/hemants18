<?php

namespace App\Http\Controllers\Admin;

use DB;
use App\Http\Controllers\Controller as BaseController;
use App\Http\Requests\StoreBlogRequest;
use App\Services\BlogService;
use App\Services\BlogCategoryService;
use App\Services\BlogAuthorService;
use App\Services\BlogTagService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule; 
use Inertia\Inertia;
use Helper;
use Session;
use Validator;

class BlogController extends BaseController
{
    public function __construct(
        BlogService $blogService,
        BlogAuthorService $BlogAuthorService,
        BlogCategoryService $BlogCategoryService,
        BlogTagService $BlogTagService,
    )
    {
        $this->blogService = $blogService;
        $this->BlogAuthorService = $BlogAuthorService;
        $this->BlogCategoryService = $BlogCategoryService;
        $this->BlogTagService = $BlogTagService;
    }

    /**
    * Display a listing of the resource.
    *
    * @return Response
    */
    public function index(Request $request){
        return Inertia::render('Admin/Blog/Post', [
            'title' => __('Blog'),
            'rows' => $this->blogService->get($request),
            'tags' => $this->BlogTagService->getActive()->map(function ($tag) { return [ 'id' => $tag->name,'name' => $tag->name];}), 
            'author' => $this->BlogAuthorService->getActive()->map(function ($author) { return [ 'value' => $author->id,'label' => $author->full_name];}), 
            'category' => $this->BlogCategoryService->getActive()->map(function ($category) { return [ 'value' => $category->id,'label' => $category->name];}), 
            'filters' => $request->all()
        ]);
    }

    /**
     * Store record.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBlogRequest $request)
    {
        $this->blogService->store($request);

        return redirect('/admin/blog/posts')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Blog added successfully!')
            ]
        );
    }

    /**
    * Display the specified resource.
    *
    * @param  int  $id
    * @return Response
    */
    public function show($id)
    {
        $query = $this->blogService->getByUuid($id);

        return response()->json(['success' => true, 'item'=> $query]);
    }

    /**
     * Update record.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreBlogRequest $request, $id)
    {
        $this->blogService->store($request, $id);

        return redirect('/admin/blog/posts')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Blog updated successfully!')
            ]
        );
    }

    /**
     * Delete record.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->blogService->delete($id);

        return redirect('/admin/blog/posts')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Blog deleted successfully!')
            ]
        );
    }
}