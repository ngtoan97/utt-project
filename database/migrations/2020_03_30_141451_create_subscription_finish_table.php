<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionFinishTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscription_finish', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('teacher_id');
            $table->unsignedInteger('student_id');
            $table->unsignedInteger('project_id');
            $table->string('description');
            $table->unsignedInteger('subscription_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subsription_finish');
    }
}
