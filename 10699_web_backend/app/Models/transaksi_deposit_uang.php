<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class transaksi_deposit_uang extends Model
{
    use HasFactory;
    protected $table = 'transaksi_deposit_uang';  
    protected $guarded = ['id_deposit_uang'];
    protected $primaryKey = 'id_deposit_uang';

    public function transaksi_member()
    {
        return $this->hasOne('App\Models\transaksi_member','no_struk_transaksi','no_struk_transaksi');
    }
}
