<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cinema_attendend extends Model
{
    use HasFactory;
    protected $table='cinema_attendend';
   
    protected $fillable = [
        'cinemaId',
        'cityId',
        'movieId',
        'flag1',
        'flag2',
        'visible',
    ];
}
