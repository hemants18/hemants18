<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Http\Traits\HasUuid;

class BlogCategory extends Model
{
    use HasFactory;
    use HasUuid;

    protected $table = 'blog_categories';

    protected $fillable = [];
    public $timestamps = false;

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($category) {

            if (auth()->check()) {
                $category->created_by = auth()->user()->id;
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
        return $this->hasMany(Blog::class);
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
