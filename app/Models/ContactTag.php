<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactTag extends Model {
    use HasFactory;

    protected $guarded = [];
    public $timestamps = false;

    public function tag()
    {
        return $this->belongsTo(Tag::class);
    }
}
