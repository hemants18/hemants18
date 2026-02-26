<?php

namespace Modules\Webhook\Controllers;

use Illuminate\Routing\Controller;
use Modules\Webhook\Models\Webhook;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MainController extends Controller
{

    public function trigger($event, $organizationId, $data)
    {

        try {

            // Get all active webhooks for this event
            $webhooks = Webhook::where('organization_id', $organizationId)
                ->where('event', $event)
                ->where('status', 1)
                ->get();

            if ($webhooks->isEmpty()) {
                return true;
            }

            foreach ($webhooks as $webhook) {

                $payload = [
                    'event' => $event,
                    'organization_id' => $organizationId,
                    'data' => $data,
                    'timestamp' => now()
                ];

                $headers = $webhook->headers ?? [];

                // Send webhook
                $response = Http::withHeaders($headers)
                    ->timeout(10)
                    ->post($webhook->url, $payload);

                // Log response
                Log::info('Webhook Triggered', [
                    'url' => $webhook->url,
                    'event' => $event,
                    'status' => $response->status(),
                    'response' => $response->body()
                ]);
            }

            return true;

        } catch (\Exception $e) {

            Log::error('Webhook Failed', [
                'event' => $event,
                'error' => $e->getMessage()
            ]);

            return false;
        }

    }

}