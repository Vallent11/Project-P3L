<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class izin_instruktur extends Model
{
    use HasFactory;
    protected $table = 'izin_instruktur';
    public function instruktur()
    {
        return $this->hasOne('App\Models\instruktur','id_instruktur','id_instruktur');
    }
    public function instrukturPengganti()
    {
        return $this->hasOne('App\Models\instruktur','id_instruktur','id_instruktur_pengganti');
    }
    public function jadwalHarian()
    {
        return $this->hasOne('App\Models\jadwal_harian','id_jadwal_harian' , 'id_jadwal_harian');
    }
}
