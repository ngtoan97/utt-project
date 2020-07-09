<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('phone_number');
            $table->string('student_code')->nullable();
            $table->string('gender')->nullable();
            $table->date('birth_day')->nullable();
            $table->string('class_code')->nullable();
            $table->string('speciality')->nullable();
            $table->string('type')->nullable();
            $table->string('password');
            $table->string('is_active');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
