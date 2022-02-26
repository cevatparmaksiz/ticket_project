<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CrateTicketattendendTable extends Migration
{
      public function up()
    {
        Schema::create('ticket_attendend', function (Blueprint $table) {
            $table->id();
            $table->integer('ticketId');
            $table->integer('cinemaId');
            $table->integer('seatNo');
            $table->integer('movieId');
            $table->string('flag2');
            $table->integer('visible');
           
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ticket_attendend');
    }
}
