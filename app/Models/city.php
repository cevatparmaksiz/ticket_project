<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class city extends Model
{
    use HasFactory;
    protected  $table='city';
    protected $fillable = [
        'city_id',
        'city_title',
        'city_key',
    ];
}
