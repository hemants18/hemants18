<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model {
    use HasFactory;

    protected $guarded = [];
    public $timestamps = true;

    public function listAll($searchTerm)
    {
        return $this->where(function ($query) use ($searchTerm) {
                        $query->where('name', 'like', '%' . $searchTerm . '%');
                    })
                    ->oldest()
                    ->paginate(10);
    }

    public function contactTag()
    {
        return $this->hasMany(ContactTag::class,'tag_id');
    }
}
