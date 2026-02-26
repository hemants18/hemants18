<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Http\Traits\HasUuid;

class BlogAuthor extends Model
{
    use HasFactory;
    use HasUuid;

    protected $table = 'blog_authors';

    protected $fillable = [
        'uuid',
        'first_name',
        'last_name',
        'bio',
        'created_by',
        'deleted',
    ];
    
    protected $appends = ['full_name'];
    protected $casts = [
        'deleted' => 'boolean',
    ];

    public function listAll($searchTerm)
    {
        return $this->where(function ($query) use ($searchTerm) {

            $query->orWhereRaw("CONCAT(first_name, ' ', last_name) LIKE ?", ["%{$searchTerm}%"])
                  ->orWhere('first_name', 'like', "%{$searchTerm}%")
                  ->orWhere('last_name', 'like', "%{$searchTerm}%");

        })
        ->where('deleted', 0)
        ->oldest()
        ->paginate(10);

    }

    /*
    |--------------------------------------------------------------------------
    | Boot
    |--------------------------------------------------------------------------
    */

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($author) {

            // created_by
            if (auth()->check() && empty($author->created_by)) {
                $author->created_by = auth()->id();
            }

        });
    }

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function blogs()
    {
        return $this->hasMany(Blog::class, 'author_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */

    public function getFullNameAttribute()
    {
        return trim($this->first_name . ' ' . $this->last_name);
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('deleted', false);
    }

}
