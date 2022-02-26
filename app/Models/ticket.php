<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ticket extends Model
{
    use HasFactory;
    protected $table='ticket';
    protected $fillable = [
        'ticketName',
        'ticketPrice',
        'ticketDiscountPrice',
        'ticketStartDate',
        'ticketEndDate',
         'movieId',
         'flag2',
         'visible',
    ];
}
