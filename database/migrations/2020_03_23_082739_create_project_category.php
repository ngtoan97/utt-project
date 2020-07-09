<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectCategory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_category', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('project_id');
            $table->unsignedInteger('category_id');

            $table->foreign('project_id','project_fk_1120')->references('id')->on('projects')->onDelete('cascade');;
            $table->foreign('category_id','category_fk_1121')->references('id')->on('categories')->onDelete('cascade');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('project_category');
    }
}
