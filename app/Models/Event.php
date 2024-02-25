<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    public $fillable = [
        'title',
        'description',
        'category',
        'photos',
        'until_datetime',
        'user_id',
    ];
}
