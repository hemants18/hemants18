<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller as BaseController;
use Illuminate\Http\Request;
use App\Services\AiService;

class AiController extends BaseController
{
    protected $aiService;

    public function __construct(AiService $aiService)
    {
        $this->aiService = $aiService;
    }

    public function ask(Request $request)
    {
        $request->validate([
            'prompt' => 'required|string',
        ]);

        $templateInfo = [
            "template_name" => $request->template_name,
            "category"      => $request->category,
            "language"      => $request->language,
            "components"    => [
                [
                    "type" => "BODY",
                    "text" => ""
                ]
            ]
        ];

        $prompt = $request->prompt . "\n" .
            "Return response in strict JSON format like:\n" .
            json_encode($templateInfo, JSON_PRETTY_PRINT) . "\n" .
            "Make template Meta-compliant. Do not return explanation. Return only JSON.";

        $response = $this->aiService->generateResponse($prompt);

    //     $response = [

    //             "data" => [

    //                 "template_name" => "holy_festival_2026",
    //                 "category"      => "UTILITY",
    //                 "language"      => "en",
    //                 "components"    => [
    //                     [
    //                         "type" => "BODY",
    //                         "text" => "🌸 Celebrate the joyous occasion of Holi with us on March 6, 2026! 🎉 Join us for a day filled with colors, laughter, and love. Don't miss out on our special events and activities. Wishing you a vibrant and joyous Holi! 💖"
    //                     ]
    //                 ]

    //             ]

                
    // ];


        return response()->json($response);
    }
}
