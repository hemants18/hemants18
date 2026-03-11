<?php

namespace App\Services;

use App\Models\OptinSetting;

class OptinSettingService
{

    private $organizationId;
    
    public function __construct($organizationId = NULL)
    {
        $this->organizationId = $organizationId;
    }

    public function getSettings()
    {
        return OptinSetting::where('organization_id', $this->organizationId)->first();
    }

    public function toggle($request)
    {
        $db = $this->getSettings();
        if(!$db) $db = new OptinSetting;
        $db->subscription_enabled = $request->enabled == true ? false : true;
        $db->organization_id = $this->organizationId;
        return $db->save();
    }

    public function saveSettings($data)
    {
        $db = $this->getSettings();
        if(!$db) $db = new OptinSetting;

        $subscription_keywords = $data['subscription_keywords'] ? json_encode(explode(',' , $data['subscription_keywords'])) : null; 
        $unsubscribe_keywords = $data['unsubscribe_keywords'] ? json_encode(explode(',' , $data['unsubscribe_keywords'])) : null; 

        $db->subscription_enabled = $db->subscription_enabled ?? true; 
        $db->subscription_keywords = $subscription_keywords ?? $db->subscription_keywords; 
        $db->unsubscribe_keywords = $unsubscribe_keywords ?? $db->unsubscribe_keywords; 
        $db->subscribe_message = $data['subscribe_message'] ?? $db->subscribe_message; 
        $db->resubscribe_message = $data['resubscribe_message'] ?? $db->resubscribe_message; 
        $db->unsubscribe_message = $data['unsubscribe_message'] ?? $db->unsubscribe_message; 

        $db->save();
    }

}