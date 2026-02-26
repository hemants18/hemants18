<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Str;
use App\Http\Traits\HasUuid;
use Carbon\Carbon;

class Blog extends Model
{
    use HasFactory;
    use HasUuid;

    protected $table = 'blog_posts';
    public $timestamps = false;
    public $with = ['author','category'];
    protected $fillable = [
        'uuid',
        'slug',
        'author_id',
        'category_id',
        'tags',
        'title',
        'content',
        'image',
        'is_featured',
        'meta_title',
        'meta_description',
        'meta_keywords',
        'published',
        'publish_date',
    ];

    protected $casts = [
        'publish_date' => 'datetime',
        'tags' => 'array',
        'deleted' => 'boolean',
    ];

    /*
    |--------------------------------------------------------------------------
    | Boot
    |--------------------------------------------------------------------------
    */

    protected static function boot()
    {
        parent::boot();

         static::creating(function ($blog) {
            $blog->slug = self::generateUniqueSlug($blog->title);
            if (auth()->check()) {
                $blog->created_by = auth()->id();
            }
        });

        static::updating(function ($blog) {
            if ( $blog->isDirty('title') ) {
                $blog->slug = self::generateUniqueSlug($blog->title, $blog->id);
            }
        });
    }

    protected static function generateUniqueSlug($title, $ignoreId = null)
    {
        $slug = Str::slug($title);
        $originalSlug = $slug;
        $count = 1;

        while (
            static::where('slug', $slug)
                ->when($ignoreId, function ($query) use ($ignoreId) {
                    $query->where('id', '!=', $ignoreId);
                })
                ->exists()
        ) {
            $slug = $originalSlug . '-' . $count++;
        }

        return $slug;
    }


    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function author()
    {
        return $this->belongsTo(BlogAuthor::class, 'author_id');
    }

    public function category()
    {
        return $this->belongsTo(BlogCategory::class);
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */
    protected $appends = ['publish_date_formatted'];

    public function getPublishDateFormattedAttribute()
    {
        return $this->publish_date
            ? Carbon::parse($this->publish_date)->format('F d, Y')
            : null;
    }

    public function scopePublished($query)
    {
        return $query->where('published', 1);
    }

    /*
    |--------------------------------------------------------------------------
    | Lists
    |--------------------------------------------------------------------------
    */

    public function listAll($searchTerm)
    {
        return $this->where(function ($query) use ($searchTerm) {
                        $query->where('title', 'like', '%' . $searchTerm . '%');
                    })
                    ->orderBy('publish_date', 'desc')
                    ->paginate(10);
    }

}
