<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class instruktur extends Model
{
    use HasFactory;
    protected $table = 'instruktur';
    protected $guarded = [];
    protected $primaryKey = 'id_instruktur';
    public $timestamps = false;

    public function pengguna()
    {
        return $this->hasOne(pengguna::class,'id_pengguna','id_pengguna');
    }
}