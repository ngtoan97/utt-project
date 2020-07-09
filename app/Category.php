<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';

    protected $fillable = [
        'id',
        'name',
        'description',
        'created_at',
        'updated_at'
    ];

    public function projects()
    {
        return $this->belongsToMany(Project::class,'project_category','category_id','project_id');
    }
}
