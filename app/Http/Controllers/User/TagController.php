<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller as BaseController;
use App\Models\Tag;
use App\Models\ContactTag;
use App\Http\Requests\StoreTag;
use App\Http\Resources\TagResource;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule; 
use Inertia\Inertia;
use DB;
use Helper;
use Session;
use Validator;
use Redirect;

class TagController extends BaseController
{
    public function index(Request $request, $id = null){
        return Inertia::render('User/Settings/Tag', [
            'rows' => TagResource::collection(
                Tag::withCount('contactTag')->where('deleted_at', null)->where('organization_id',session()->get('current_organization'))->latest()->paginate(10)
            ),
        ]);
    }

    public function store(StoreTag $request)
    {
        $Tag = new Tag();
        $Tag->name = $request->name;
        $Tag->color = $request->color;
        $Tag->organization_id = session()->get('current_organization');
        $Tag->save();

        return redirect('/settings/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag added successfully')
            ]
        );
    }

    public function show($id)
    {
        $Tag = Tag::where('id', $id)->first();
        return response()->json(['success' => true, 'item'=> $Tag]);
    }

    public function edit($id)
    {
        $Tag = Tag::where('id', $id)->first();
        return response()->json(['success' => true, 'item'=> $Tag]);
    }

    public function update(StoreTag $request, $id)
    {
        $Tag = Tag::findOrFail($id);
        $Tag->name = $request->name;
        $Tag->color = $request->color;
        $Tag->save();

        return redirect('/settings/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag updated successfully')
            ]
        );
    }

    public function assign(Request $request)
    {
        // $db = ContactTag::where(['contact_id'=>$request->contact/*,'tag_id'=> $request->tags*/])->first();
        // if(!$db)
        // {
        //     $db = new ContactTag;
        //     $db->contact_id = $request->contact;
        // }
        $db = new ContactTag;
        $db->contact_id = $request->contact;
        $db->tag_id = $request->tags;
        $db->assign_by = auth()->user()->id;
        $db->save();

        return Redirect::back()->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag assign successfully!')
            ]
        );

        // return response()->json(['success' => true, 'item'=> $db]);
    }

    /**
     * Delete Tag.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Tag = Tag::findOrFail($id);
        $Tag->deleted_at = date('Y-m-d H:i:s');
        $Tag->save();

        return redirect('/settings/tags')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Tag deleted successfully')
            ]
        );
    }
}