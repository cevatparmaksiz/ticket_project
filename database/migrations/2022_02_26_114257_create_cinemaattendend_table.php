<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCinemaattendendTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cinema_attendend', function (Blueprint $table) {
            $table->id();
            $table->integer('cinemaId');
            $table->integer('cityId');
            $table->integer('movieId');
            $table->string('flag1');
            $table->string('flag2');
            $table->integer('visible');
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
        Schema::dropIfExists('cinema_attendend');
    }
}
