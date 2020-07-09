<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SubscriptionFinish extends Model
{
    protected $table = 'subscription_finish';

    protected $fillable = [
        'id',
        'teacher_id',
        'student_id',
        'project_id',
        'description',
        'created_at',
        'updated_at',
        'subscription_id'
    ];

    public function student()
    {
        return $this->belongsTo(User::class,'student_id');
    }

    public function teacher()
    {
        return $this->belongsTo(User::class,'teacher_id');
    }

    public function project()
    {
        return $this->belongsTo(Project::class,'project_id');
    }

    public function subscription(): BelongsTo
    {
        return $this->belongsTo(Subscription::class,'subscription_id');
    }

    protected $appends = [
        'teacher_name',
        'student_name',
        'project_name',
    ];

    /**
     * Accessor trả về thông tin từ model khi người dùng gọi tới thuộc tính name_count
     * @return string
     */
    public function getTeacherNameAttribute()
    {
        return $this->teacher->name;
    }

    public function getStudentNameAttribute()
    {
        return $this->student->name;
    }

    public function getProjectNameAttribute()
    {
        return $this->project->name;
    }


}
