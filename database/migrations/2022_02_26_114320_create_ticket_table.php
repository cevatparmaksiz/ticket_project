<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ticket', function (Blueprint $table) {
            $table->id();
            $table->string('ticketName');
            $table->double('ticketPrice',8,2);
            $table->double('ticketDiscountPrice',8,2);
            $table->timestamp('ticketStartDate')->nullable();
            $table->timestamp('ticketEndDate')->nullable();
            $table->integer('movieId');
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
        Schema::dropIfExists('ticket');
    }
}
