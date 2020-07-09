<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRelationshipSubscriptionFinishTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('subscription_finish',function (Blueprint $table){
            $table->foreign('teacher_id','teacher_1126')->references('id')->on('users');
            $table->foreign('student_id','student_1126')->references('id')->on('users');
            $table->foreign('project_id','project_1126')->references('id')->on('projects');
            $table->foreign('subscription_id','subscription_1126')->references('id')->on('subscriptions')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
