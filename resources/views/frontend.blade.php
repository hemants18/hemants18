<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    @if(app()->environment('production'))
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    @endif
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @php
        $config = collect($page['props']['config']);
        $google_analytics = $config->firstWhere('key', 'google_analytics_tracking_id')['value'] ?? null;
        $favicon = $config->firstWhere('key', 'favicon')['value'] ?? null;
        $favicon = $favicon ? '/media/' . $favicon : '/images/favicon.png';
    @endphp

    @if($favicon)
    <link rel="icon" href="{{ url($favicon) }}">
    @endif

    <title>Wa Biz Boost - WhatsApp Business API Solutions | WaBizBoost</title>
    <meta
      name="description"
      content="Supercharge your business with Wa Biz Boost. Automate customer support, send bulk broadcasts, and drive sales using the WhatsApp Business API."
    />
    <meta
      name="keywords"
      content="WhatsApp Business API, WhatsApp Marketing, Chat Automation, Business Messaging, Wa Biz Boost, Chatbots, Bulk Broadcast"
    />
    <meta name="author" content="Wa Biz Boost" />
    <meta name="robots" content="index, follow" />
    <link rel="canonical" href="https://www.wabizboost.com/" />

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.wabizboost.com/" />
    <meta
      property="og:title"
      content="Wa Biz Boost - WhatsApp Business API Solutions"
    />
    <meta
      property="og:description"
      content="Automate chats, broadcast messages, and boost sales with the world's most popular messaging app."
    />
    <meta property="og:image" content="assets/images/hero_dashboard.png" />

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image" />
    <meta property="twitter:url" content="https://www.wabizboost.com/" />
    <meta
      property="twitter:title"
      content="Wa Biz Boost - WhatsApp Business API Solutions"
    />
    <meta
      property="twitter:description"
      content="Automate chats, broadcast messages, and boost sales with the world's most popular messaging app."
    />
    <meta property="twitter:image" content="assets/images/hero_dashboard.png" />

    <!-- Favicon Links -->
    <link rel="icon" type="image/png" href="assets/images/favicon.png" />

    @vite(['resources/js/app.js', 'resources/css/app.css'])

    <!-- External CSS Libraries -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css" />

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="assets/css/font-awesome.6.5.1.all.min.css" />
    @if (!empty($google_analytics))
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ $google_analytics }}"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{{ $google_analytics }}');
    </script>
    @endif

    @inertiaHead
</head>
<body>
    @inertia


    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/swiper-bundle.min.js"></script>
    <!-- Custom Script -->
    <script src="assets/js/script.js"></script>
</body>
</html>
