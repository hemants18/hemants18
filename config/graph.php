<?php

return [
    'api_version' => env('GRAPH_API_VERSION', 'v20.0'), // Default to v20.0
    'meta_redirect_uri' => env('APP_URL').'whatsapp/oauth/callback/'
];