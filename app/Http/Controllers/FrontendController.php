<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller as BaseController;
use App\Http\Resources\FaqResource;
use App\Http\Resources\PageResource;
use App\Models\Addon;
use App\Models\Faq;
use App\Models\Page;
use App\Models\Review;
use App\Models\Query;
use App\Models\Setting;
use App\Models\SubscriptionPlan;
use App\Services\CampaignService;
use App\Services\UpdateService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use Inertia\Inertia;
use DB;

class FrontendController extends BaseController
{
    private $campaignService;
    private $frontend;

    public function __construct(CampaignService $campaignService)
    {
        $this->campaignService = $campaignService;

        $this->frontend = Setting::where('key', 'display_frontend')->first();
        $this->frontend->frontend_active = $this->frontend ? $this->frontend->value : 1;
        
    }
    
    public function index(Request $request){
        
        if($this->frontend->frontend_active){
            $data['plans'] = SubscriptionPlan::where('status', 'active')->whereNull('deleted_at')->get();
            $data['faqs'] = FaqResource::collection(
                Faq::where('status', '1')->get()
            );
            $data['reviews'] = Review::where('status', 1)->get();
            $data['currency'] = Setting::where('key', 'currency')->first()->value;

            $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
            $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();
            $data['pages'] = Page::get();
            $data['addons'] = Addon::where('status', 1)->where('is_plan_restricted', 1)->pluck('is_active', 'name');
            $data['enable_ai_billing'] = Setting::where('key', 'enable_ai_billing')->value('value') ?? 0;

            return Inertia::render('Frontend/Index', $data);
            // return Inertia::render('Frontend/Index', $data);
        } else {
            $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period', 'allow_facebook_login', 'allow_google_login'];
            $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();

            return Inertia::render('Auth/Login', $data);
        }
    }

    public function pages(Request $request, $slug){
        $name = str_replace('-', ' ', $slug);
        $page = Page::where('name', $name)->first();

        $data['page'] = new PageResource($page);
        $data['pages'] = Page::get();
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();

        return Inertia::render('Frontend/Dynamic', $data);
    }

    public function about(Request $request){
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();

        return Inertia::render('Frontend/About', $data);
    }

    public function pricing(Request $request){
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();
        $data['plans'] = SubscriptionPlan::where('status', 'active')->whereNull('deleted_at')->get();
        $data['reviews'] = Review::where('status', 1)->get();
        $data['faqs'] = FaqResource::collection(
                Faq::where('status', '1')->get()
            );
        return Inertia::render('Frontend/Pricing', $data);
    }

    public function termsOfService()
    {
        $name = str_replace('-', ' ', 'terms-of-service');
        $page = Page::where('name', $name)->first();

        $data['page'] = new PageResource($page);
        $data['pages'] = Page::get();
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();
        return Inertia::render('Frontend/Security', $data);
    }

    public function privacy()
    {
        $name = str_replace('-', ' ', 'privacy-policy');
        $page = Page::where('name', $name)->first();

        $data['page'] = new PageResource($page);
        $data['pages'] = Page::get();
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();
        return Inertia::render('Frontend/Security', $data);
    }

    public function refund()
    {
        $name = str_replace('-', ' ', 'refund-policy');
        $page = Page::where('name', $name)->first();

        $data['page'] = new PageResource($page);
        $data['pages'] = Page::get();
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();
        return Inertia::render('Frontend/Security', $data);
    }

    public function contact(Request $request){
        $keys = ['logo', 'company_name', 'address', 'email', 'phone', 'socials', 'trial_period'];
        $data['companyConfig'] = Setting::whereIn('key', $keys)->pluck('value', 'key')->toArray();

        $data['faqs'] = FaqResource::collection(
                Faq::where('status', '1')->get()
            );

        return Inertia::render('Frontend/Contact', $data);
    }

    public function sendCampaign(){
        $this->campaignService->sendCampaign();
    }

    public function changeLanguage($locale){
        app()->setLocale($locale);
        session()->put('locale', $locale);

        return redirect()->back();
    }


    public function clientDemo(Request $request)
    {
        $validated = $request->validate([
            'name'     => 'required|string|max:255',
            'email'    => 'required|email',
            'phone'    => 'required|digits_between:10,15',
            'use_case' => 'required|string',
            'message'  => 'required|min:10',
            'type'  => 'required',
        ]);

        // save / email / CRM / queue job
        $validated['subject'] = $validated['use_case'];
        $validated['msg'] = $validated['message'];
        $validated['type'] = $validated['type'];

        Query::create($validated);

        return redirect()->back()->with(
            'status', [
                'type' => 'success', 
                'message' => __('Demo scheduled successfully!')
            ]
        );
    }

    public function migrate(){
        (new UpdateService)->migrate('1.4');
    }
}