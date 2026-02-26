<?php

namespace App\Http\Controllers\Admin;

use DB;
use App\Http\Controllers\Controller as BaseController;
use App\Http\Requests\StoreBlogTag;
use App\Services\BlogTagService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule; 
use Inertia\Inertia;
use Helper;
use Session;
use Validator;

class BlogTagController extends BaseController
{
    public function __construct(BlogTagService $blogTagService)
    {
        $this->blogTagService = $blogTagService;
    }

    /**
    * Display a listing of the resource.
    *
    * @return Response
    */
    public function index(Request $request){
        return Inertia::render('Admin/Blog/Tags', [
            'title' => __('TAGs'),
            'rows' => $this->blogTagService->get($request), 
            'filters' => $request->all()
        ]);
    }

    /**
     * Store record.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBlogTag $request)
    {
        $this->blogTagService->store($request);

        return redirect('/admin/blog/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag added successfully!')
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
        $query = $this->blogTagService->getByUuid($id);
        return response()->json(['success' => true, 'item'=> $query]);
    }
    
    /**
     * Update record.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreBlogTag $request, $id)
    {
        $this->blogTagService->store($request, $id);

        return redirect('/admin/blog/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag updated successfully!')
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
        $this->blogTagService->delete($id);

        return redirect('/admin/blog/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag deleted successfully!')
            ]
        );
    }
}