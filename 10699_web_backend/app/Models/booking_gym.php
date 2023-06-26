<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class booking_gym extends Model
{
    use HasFactory;
        protected $table = 'booking_gym';
    protected $primaryKey = 'no_booking_gym';
    protected $guarded = [];
    public $timestamps = false; 
    public function sesi()
    {
        return $this->hasOne(sesi_gym::class,'id_sesi_gym','id_sesi_gym');
    }
    public function member()
    {
        return $this->hasOne(member::class,'id_member','id_member');
    }
}
