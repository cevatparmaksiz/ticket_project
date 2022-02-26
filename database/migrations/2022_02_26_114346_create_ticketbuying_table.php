<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketbuyingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
   public function up()
    {
        Schema::create('ticket_buying', function (Blueprint $table) {
            $table->id();
            $table->integer('ticketattendendId');
            $table->integer('cinemaId');
            $table->integer('userId');
            $table->integer('ticketCount');
            $table->integer('seatNo');
            $table->timestamp('expiryDate');
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
        Schema::dropIfExists('ticket_buying');
    }
}
