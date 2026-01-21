<?php

namespace App\Http\Controllers\User;

use DB;
use App\Http\Controllers\Controller as BaseController;
use App\Http\Requests\StoreFlow;
use App\Services\Flows\FlowBuilderService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class FlowsBuilderController extends BaseController
{
    private $flowBuilderService;

    public function __construct(FlowBuilderService $flowBuilderService)
    {
        $this->flowBuilderService = $flowBuilderService;
    }

    public function index(Request $request){

        $rows = $this->flowBuilderService->list($request);
        return Inertia::render('User/Flows/Index', [ 'title' => __('Canned replies'), 'allowCreate' => true, 'rows' => $rows, 'filters' => request()->all() ]);
    }

    public function create(){
        $data['title'] = __('Flow Create');
        return Inertia::render('User/Flows/Create', $data);
    }

    public function save(StoreFlow $request)
    {
        $rows = $this->flowBuilderService->save($request);
        return redirect()->route('flowsbuider')->with(
            'status', [
                'type' => 'success', 
                'message' => __('Flow added successfully!')
            ]
        );
    }

    public function builder($id){
        $data = [ 
            'flow'      => $this->flowBuilderService->getRows($id),
            'nodes'     => [],   // JSON
            'edges'     => [],
            'templates' => [],
            'flows'     => []
        ];
        $data['title'] = __('Flow Builder');
        $placeholders = config('formats.placeholders');
        $organizationId = session()->get('current_organization');
        $data['flowId'] =  'create';
        return Inertia::render('User/Flows/Builder', $data);
        // return Inertia::render('User/Flows/Create', $data);
    }


    public function uploadFile(Request $request)
    {

        $file_name = $this->flowBuilderService->uploadFile($request);
        // $file_name = time() . '.' . $request->file('file')->getClientOriginalExtension();
        // $request->file('file')->move(public_path('client/flow_builder'), $file_name);
        // $flow      = FlowBuilderFile::create([
        //     'file'               => 'client/flow_builder/' . $file_name,
        //     'flow_template_id'   => $request->id,
        //     'flow_template_type' => $request->type,
        // ]);

        // return response()->json([
        //     'success'     => __('file_uploaded_successfully'),
        //     'file_object' => [
        //         'id'   => $flow->flow_template_id,
        //         'file' => static_asset($flow->file),
        //         'ext'  => pathinfo($flow->file, PATHINFO_EXTENSION),
        //     ],
        // ]);

        return response()->json([
            'success'     => __('file_uploaded_successfully'),
            'file_object' => [
                'id'   => $request->id,
                'file' => $file_name,
                'ext'  => pathinfo('public/flow_builder/' . $file_name, PATHINFO_EXTENSION),
            ],
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'              => 'required|string',
            'contact_list_id' => 'nullable|integer|exists:contacts_lists,id',
            'segment_id' => 'nullable|integer|exists:segments,id',
        ]);

        return $this->flowBuilderService->store($request);
    }
}