<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Http\Traits\HasUuid;

class BlogTag extends Model
{
    use HasFactory;
    use HasUuid;

    protected $table = 'blog_tags';

    protected $fillable = [];
    public $timestamps = false;

    /*
    |--------------------------------------------------------------------------
    | Boot
    |--------------------------------------------------------------------------
    */
    
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($tags) {
            if (auth()->check()) {
                $tags->created_by = auth()->id();
            }
        });
    }

    public function listAll($searchTerm)
    {
        return $this->where(function ($query) use ($searchTerm) {
                        $query->where('name', 'like', '%' . $searchTerm . '%');
                    })
                    ->where('deleted',0)
                    ->oldest()
                    ->paginate(10);
    }
}
