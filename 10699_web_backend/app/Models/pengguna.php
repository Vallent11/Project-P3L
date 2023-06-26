<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class pengguna extends Authenticatable
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'pengguna';
    protected $guarded = ['id_pengguna'];
    protected $primaryKey = 'id_pengguna';
    // public $timestamps = false;

    protected $hidden = [
        'password',
        'remember_token',
    ];

}