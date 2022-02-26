<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ticket_attendend extends Model
{
    use HasFactory;
    
    protected $table='ticket_attendend';
    protected $fillable = [
        'ticketId',
        'cinemaId',
        'seatNo',
        'movieId',
        'flag2',
        'visible',
    ];
}
