<?php

namespace App\Models\Flows;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FlowNode extends Model
{
    use HasFactory;

    protected $fillable = ['flow_id', 'node_id', 'type', 'position', 'data','connections'];

    protected $casts    = [
        'position' => 'array',
        'data'     => 'array',
        'connections'     => 'array',
    ];


    public static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $model->created_by         = auth()->user() ? auth()->user()->id : null;
            $model->created_at         = date('Y-m-d H:i:s');
            if(empty($model->organization_id)){
                $model->organization_id = session()->get('current_organization');
            }
        
        });
        static::updating(function ($model) {
            $model->created_by         = auth()->user() ? auth()->user()->id : null;
            $model->updated_at         = date('Y-m-d H:i:s');
            if(empty($model->organization_id)){
                $model->organization_id = session()->get('current_organization');
            }
        });
    }

    public function flow(): BelongsTo
    {
        return $this->belongsTo(Flow::class);
    }
    
    public function scopeWithPermission($query)
    {
        if (auth()->user()->role != 'admin') {
            $client = session()->get('current_organization');
            // $client = auth()->user()->client;
            $query->where('organization_id', $client->id);
        }
    }

}