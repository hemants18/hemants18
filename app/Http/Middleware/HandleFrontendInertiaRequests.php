<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Inertia\Middleware;
use Inertia\Inertia;

class HandleFrontendInertiaRequests  extends Middleware
{
    public function handle(Request $request, Closure $next)
    {
        Inertia::setRootView('frontend');

        return $next($request);
    }

    // protected $rootView = 'frontend';

    // public function version(Request $request): ?string
    // {
    //     return parent::version($request);
    // }

    // public function share(Request $request): array
    // {
    //     return array_merge(parent::share($request), [
    //         //
    //     ]);
    // }
}
