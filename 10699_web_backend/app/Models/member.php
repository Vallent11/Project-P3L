<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class member extends Model
{
    use HasFactory;
    protected $table = 'member';
    protected $guarded = [];
    protected $primaryKey = 'id_member';
    public $timestamps = false;

    public function pengguna()
    {
        return $this->hasOne('App\Models\Pengguna','id_pengguna','id_pengguna');
    }

    public function latest($column = 'nama_member'){
        return $this->orderBy($column,'descript');
    }
    protected $casts = [
        'id_member' => 'string'
    ];
}
