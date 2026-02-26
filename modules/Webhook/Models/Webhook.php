<?php

namespace Modules\Webhook\Models;

use Illuminate\Database\Eloquent\Model;

class Webhook extends Model
{
    protected $table = 'webhooks';

    protected $fillable = [
        'uuid',
        'organization_id',
        'event',
        'url',
        'method',
        'headers',
        'status',
    ];

    protected $casts = [
        'headers' => 'array'
    ];
}