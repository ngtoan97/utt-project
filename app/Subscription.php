<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $table = 'subscriptions';

    protected $fillable = [
        'id',
        'option_one',
        'option_two',
        'student_id',
        'offer_project',
        'description',
        'created_at',
        'updated_at'
    ];

    public function optionOne()
    {
        return $this->belongsTo(Project::class,'option_one');
    }

    public function optionTwo()
    {
        return $this->belongsTo(Project::class,'option_two');
    }

    public function student()
    {
        return $this->belongsTo(User::class,'student_id');
    }

    public function subscriptionFinish()
    {
        return $this->hasOne(SubscriptionFinish::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class,'subscription_category', 'subscription_id', 'category_id');
    }
}
