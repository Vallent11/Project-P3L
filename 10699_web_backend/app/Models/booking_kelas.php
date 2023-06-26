<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class booking_kelas extends Model
{
    use HasFactory;
    protected $table = 'booking_kelas';
    protected $primaryKey = 'no_booking_kelas';
    public $timestamps = false;
    protected $guarded = [];

    public function jadwal_harian(){
    return $this->hasOne(jadwal_harian::class,'id_jadwal_harian','id_jadwal_harian');
    }

    public function member(){
    return $this->hasOne(member::class,'id_member','id_member');
    }
}
