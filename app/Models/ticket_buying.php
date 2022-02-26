<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ticket_buying extends Model
{
    use HasFactory;
    protected $table='ticket_buying';
    protected $fillable = [
        'ticketattendendId',
        'cinemaId',
        'userId',
        'ticketCount',
        'seatNo',
        'expiryDate',
        'visible',
    ];
}
