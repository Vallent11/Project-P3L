<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class pegawai extends Model
{
    use HasFactory;
    protected $table = 'pegawai';
    protected $guarded = [];
    public $timestamps = false;

    public function pengguna()
    {
        return $this->hasOne('\pengguna');
    }
}
