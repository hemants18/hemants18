<?php

namespace App\Services;

use OpenAI;
use Exception;
use Illuminate\Support\Facades\Log;

class AiService
{
    protected $client;

    public function __construct()
    {
        $this->client = OpenAI::client(config('services.openai.key'));
    }

    public function generateResponse(string $prompt): array
    {
        try {

            $response = $this->client->chat()->create([
                'model' => 'gpt-4o-mini',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => 'You are a helpful assistant.'
                    ],
                    [
                        'role' => 'user',
                        'content' => $prompt
                    ],
                ],
                'temperature' => 0.7,
            ]);

            return [
                'success' => true,
                'message' => 'AI response generated successfully.',
                'data' => $response['choices'][0]['message']['content'] ?? '',
            ];

        } catch (Exception $e) {

            // Log error for debugging
            Log::error('AI Service Error: ' . $e->getMessage());

            return [
                'success' => false,
                'message' => 'AI service failed. Please try again later.',
                'error' => $e->getMessage(), // remove in production if needed
                'data' => null,
            ];
        }
    }
}
