<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CronJob extends Model
{
    protected $table = 'cron_job';

    protected $fillable = [
        'model',
        'description',
        'start_at',
        'end_at',
        'created_at',
        'updated_at'
    ];

}
