<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Project extends Model
{
    protected $table = 'projects';

    protected $fillable = [
        'id',
        'name',
        'number',
        'status',
        'description',
        'teacher_id',
        'created_at',
        'updated_at'
    ];

    public function teacher(): BelongsTo
    {
        return $this->belongsTo(User::class,'teacher_id');
    }

    public function optionOne()
    {
        return $this->hasMany(Subscription::class,'option_one');
    }

    public function optionTwo()
    {
        return $this->hasMany(Subscription::class,'option_two');
    }

    public function finish()
    {
        return $this->hasMany(SubscriptionFinish::class,'project_id');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class,'project_category', 'project_id', 'category_id');
    }

    protected $appends = [
        'name_count',
    ];

    /**
     * Accessor trả về thông tin từ model khi người dùng gọi tới thuộc tính name_count
     * @return string
     */
    public function getNameCountAttribute()
    {
        return $this->name . '(' . count($this->finish()->get()).'/'.$this->number.'/'. count($this->optionOne()->get()).'/'. count($this->optionTwo()->get()).')';
    }
}
