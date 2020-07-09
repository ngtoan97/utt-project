<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    protected $table = 'users';
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone_number',
        'student_code',
        'class_code',
        'speciality',
        'type',
        'is_active',
        'remember_token',
        'created_at',
        'updated_at',
        'gender',
        'birth_day',
        'avatar',
        'password'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function subscription(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Subscription::class,'id');
    }

    public function subscriptionFinishStudent(){
        return $this->hasOne(SubscriptionFinish::class,'id','student_id');
    }

    public function subscriptionFinishTeacher(){
        return $this->hasOne(SubscriptionFinish::class,'id','teacher_id');
    }
}
