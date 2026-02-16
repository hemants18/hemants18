<?php

namespace Modules\IntelliReply\Services;

use OpenAI\Client as OpenAIClient;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Exception;

class AIResponseService
{
    protected $clientConfig;
    protected $client;
    protected $clientId;

    public function __construct($clientId)
    {
        $this->clientId = $clientId;

        $this->clientConfig = DB::table('ai_clients')
            ->where('id', $clientId)
            ->first();

        if (!$this->clientConfig) {
            throw new Exception("AI configuration not found.");
        }

        $this->client = new OpenAIClient([
            'api_key' => $this->clientConfig->api_key
        ]);
    }

    /**
     * MAIN METHOD
     */
    public function ask(string $prompt, string $taskType = 'chat')
    {
        try {

            //Get knowledge context (only for chat/chatbot)
            $knowledge = $taskType !== 'template'
                ? $this->searchKnowledge($prompt)
                : '';

            $systemPrompt = $this->buildSystemPrompt($taskType, $knowledge);

            $response = $this->client->chat()->create([
                'model' => $this->clientConfig->model,
                'messages' => [
                    ['role' => 'system', 'content' => $systemPrompt],
                    ['role' => 'user', 'content' => $prompt],
                ],
                'temperature' => $taskType === 'template'
                    ? 0.2
                    : (float)$this->clientConfig->temperature,
                'max_tokens' => (int)$this->clientConfig->max_tokens,
            ]);

            $output = $response['choices'][0]['message']['content'] ?? '';

            // Template mode → return parsed JSON
            if ($taskType === 'template') {
                $decoded = json_decode($output, true);

                if (json_last_error() !== JSON_ERROR_NONE) {
                    throw new Exception("Invalid JSON returned from AI.");
                }

                return $decoded;
            }

            // 🎙 Optional audio response
            if ($this->clientConfig->allow_audio_response) {

                $audio = $this->client->audio()->textToSpeech([
                    'model' => $this->clientConfig->model,
                    'voice' => $this->clientConfig->voice,
                    'input' => $output
                ]);

                return [
                    'text' => $output,
                    'audio' => $audio
                ];
            }

            return $output;

        } catch (Exception $e) {

            Log::error("AIService Error: " . $e->getMessage());

            return [
                'success' => false,
                'message' => 'AI service failed.',
                'error' => $e->getMessage()
            ];
        }
    }

    /**
     * Build System Prompt
     */
    protected function buildSystemPrompt($taskType, $knowledge)
    {
        if ($taskType === 'template') {
            return "You are a WhatsApp template generator. Output ONLY valid JSON.";
        }

        return "You are a helpful AI assistant.

Use the following knowledge to answer accurately:

{$knowledge}

If knowledge is not relevant, answer normally.";
    }

    /**
     * SEARCH KNOWLEDGE (RAG Core)
     */
    protected function searchKnowledge($query)
    {
        $queryEmbedding = $this->generateEmbedding($query);

        $chunks = DB::table('ai_knowledge_chunks')
            ->where('client_id', $this->clientId)
            ->get();

        $scores = [];

        foreach ($chunks as $chunk) {

            $storedEmbedding = json_decode($chunk->embedding, true);

            $score = $this->cosineSimilarity($queryEmbedding, $storedEmbedding);

            $scores[] = [
                'text' => $chunk->content,
                'score' => $score
            ];
        }

        usort($scores, fn($a, $b) => $b['score'] <=> $a['score']);

        $topChunks = array_slice($scores, 0, 3);

        return collect($topChunks)->pluck('text')->implode("\n\n");
    }

    /**
     * Generate Embedding
     */
    protected function generateEmbedding($text)
    {
        $response = $this->client->embeddings()->create([
            'model' => 'text-embedding-3-small',
            'input' => $text
        ]);

        return $response['data'][0]['embedding'];
    }

    /**
     * Cosine Similarity
     */
    protected function cosineSimilarity($a, $b)
    {
        $dotProduct = 0.0;
        $normA = 0.0;
        $normB = 0.0;

        foreach ($a as $i => $value) {
            $dotProduct += $value * $b[$i];
            $normA += $value * $value;
            $normB += $b[$i] * $b[$i];
        }

        return $dotProduct / (sqrt($normA) * sqrt($normB));
    }
}
