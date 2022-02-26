<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cinema extends Model
{
    use HasFactory;
    protected $table='cinema';
    protected $fillable = [
        'cinemaName',
        'cinemaAddress',
        'cinemaNo',
        'seatCount',
        'cityId',
        'flag1',
        'flag2',
        'visible',
    ];
}
