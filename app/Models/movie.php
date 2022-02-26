<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class movie extends Model
{
    use HasFactory;
    protected $table='movie';
    protected $fillable = [
        'movieName',
        'movieExp',
        'startDate',
        'endDate',
        'flag1',
        'flag2',
        'visible',
    ];
}
