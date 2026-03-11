<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OptinSetting extends Model {
    use HasFactory;

    protected $guarded = [];
    public $timestamps = true;

    protected $casts = [
        'subscription_enabled' => 'boolean',
        'subscription_keywords' => 'array',
        'unsubscribe_keywords' => 'array'
    ];
    
}
