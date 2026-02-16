<?php

namespace App\Http\Controllers\Admin;

use DB;
use App\Http\Controllers\Controller as BaseController;
use App\Http\Requests\StoreBlogCategory;
use App\Services\BlogCategoryService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule; 
use Inertia\Inertia;
use Helper;
use Session;
use Validator;

class BlogCategoryController extends BaseController
{
    public function __construct(BlogCategoryService $blogCategoryService)
    {
        $this->blogCategoryService = $blogCategoryService;
    }

    /**
    * Display a listing of the resource.
    *
    * @return Response
    */
    public function index(Request $request){
        return Inertia::render('Admin/Faq/Index', [
            'title' => __('FAQs'),
            'rows' => $this->blogCategoryService->get($request), 
            'filters' => $request->all()
        ]);
    }

    /**
     * Display Form
     *
     * @param $request
     */
    public function create(Request $request)
    {
        $query = $this->blogCategoryService->getByUuid(NULL);

        return Inertia::render('Admin/Faq/Show', ['title' => __('FAQs'), 'faq' => $query]);
    }

    /**
     * Store record.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFaq $request)
    {
        $this->blogCategoryService->store($request);

        return redirect('/admin/faqs')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Faq added successfully!')
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
        $query = $this->blogCategoryService->getByUuid($id);

        return Inertia::render('Admin/Faq/Show', ['title' => __('FAQs'), 'faq' => $query]);
    }

    /**
     * Update record.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreFaq $request, $id)
    {
        $this->blogCategoryService->store($request, $id);

        return redirect('/admin/faqs')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Faq updated successfully!')
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
        $this->blogCategoryService->delete($id);

        return redirect('/admin/faqs')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Faq deleted successfully!')
            ]
        );
    }
}