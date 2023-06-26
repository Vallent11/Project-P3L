<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\instruktur;

class jadwal_umum extends Model
{
    use HasFactory;
    protected $table = 'jadwal_umum';  
    protected $primaryKey = 'id_jadwal_umum';
    protected $guarded = ['id_jadwal_umum'];    
    

    public function instruktur()
    {
        return $this->hasOne('App\Models\instruktur','id_instruktur','id_instruktur');
    }
    public function kelas()
    {
        return $this->hasOne('App\Models\kelas','id_kelas','id_kelas');
    }
}
