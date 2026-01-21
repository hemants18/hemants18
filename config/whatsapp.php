<?php

return [
    'price' => [
        'marketing' => env('WHATSAPP_PRICE_MARKETING', 0.7846),
        'utility' => env('WHATSAPP_PRICE_UTILITY', 0.115),
        'auth' => env('WHATSAPP_PRICE_AUTH', 0.115),
    ],
    'qr_msg' => 'Hello%2C%20I%E2%80%99d%20like%20to%20connect%20regarding%20your%20business.',
    'qr_msg_readable' => 'Hello, I’d like to connect regarding your business.',

];
