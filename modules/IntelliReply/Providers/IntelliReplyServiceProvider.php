<?php

namespace Modules\IntelliReply\Providers;

use Illuminate\Support\ServiceProvider;


class IntelliReplyServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app->register(RouteServiceProvider::class);
    }
}