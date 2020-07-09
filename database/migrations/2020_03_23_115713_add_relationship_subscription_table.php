<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRelationshipSubscriptionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('subscriptions',function (Blueprint $table){
            $table->foreign('option_one','option_one_1125')->references('id')->on('projects')->onDelete('cascade');;
            $table->foreign('option_two','option_two_1125')->references('id')->on('projects')->onDelete('cascade');;
            $table->foreign('student_id','student_1125')->references('id')->on('users')->onDelete('cascade');
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
