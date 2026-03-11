<?php
namespace App\Services;

use App\Models\Organization;
use App\Models\Setting;
use App\Models\Team;

class ChatAssignmentService
{
    protected $organizationId;
    protected $settings;

    public function __construct($organizationId)
    {
        $this->organizationId = $organizationId;

        $org = Organization::find($organizationId);
        $this->settings = json_decode($org->metadata);
    }

    public function assignAgent($ticket)
    {
        if(!$this->settings->tickets->auto_assignment){
            return null;
        }

        $strategy = $this->settings->tickets->assignment_strategy ?? 'round_robin';

        return match($strategy) {
            'round_robin' => $this->roundRobin(),
            'least_active' => $this->leastActive(),
            'random' => $this->randomAgent(),
            default => null
        };
    }

    private function getAgents()
    {
        $query = Team::where('organization_id', $this->organizationId);

        if($this->settings->tickets->online_agents_only){
            $query->where('is_online', 1);
        }

        return $query->get();
    }

    private function getAgents()
    {
        $query = Team::where('organization_id', $this->organizationId);

        if($this->settings->tickets->online_agents_only){
            // $query->where('is_online', 1); not available 
        }

        return $query->get();
    }

    private function leastActive()
    {
        $capacity = $this->settings->tickets->agent_capacity ?? -1;

        $agent = Team::where('organization_id', $this->organizationId)
            ->withCount(['tickets' => function($q){
                $q->where('status','open');
            }])
            ->orderBy('tickets_count')
            ->first();

        if( $capacity === -1 && $agent ) {
            return $agent->user_id;
        }
        else if($agent && $agent->tickets_count < $capacity){
            return $agent->user_id;
        }

        return null;
    }

    private function randomAgent()
    {
        $agents = $this->getAgents();

        if(!$agents->count()){
            return null;
        }

        return $agents->random()->user_id;
    }

    private function updatePointer($agentId)
    {
        $org = Organization::find($this->organizationId);
        $meta = json_decode($org->metadata);

        $meta->tickets->round_robin_last_agent_id = $agentId;

        $org->metadata = json_encode($meta);
        $org->save();
    }
}