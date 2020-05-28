<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCarManagementTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('car_management', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('cars_id')->unsigned();
            $table->foreign('cars_id')->references('id')->on('cars');
            $table->integer('segments_id')->unsigned();
            $table->foreign('segments_id')->references('id')->on('segments');
            $table->integer('user_id'); 
            $table->foreign('user_id')->references('id')->on('users');
            $table->date('date_from');
            $table->date('date_to');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('car_management');
    }
}
