<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionCategoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscription_category', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('subscription_id')->nullable();
            $table->unsignedInteger('category_id')->nullable();

            $table->foreign('subscription_id','subscription_fk_1126')->references('id')->on('subscriptions')->onDelete('cascade');;
            $table->foreign('category_id','category_fk_1126')->references('id')->on('categories')->onDelete('cascade');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subscription_category');
    }
}
