<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\transaksi_member;
use App\Models\member;
use App\Models\transaksi_aktivasi_member;

class aktivasiController extends Controller
{
    public function index()
    {
        $count= transaksi_member::count();
        return $count;
    }

    public function store(Request $request)
    {
    try{
         //* Create Instruktur
            $transaksi_member = transaksi_member::create([
                'jenis_transaksi' => 'Aktivasi Member',
                'id_pegawai' => $request->id_pegawai,
                'id_member' => $request->id_member,
            ]);
            $transaksi_aktivasi_member = transaksi_member::where('jenis_transaksi', '=', 'Aktivasi Member')
                ->where('id_pegawai', '=', $request->id_pegawai)
                ->where('id_member', '=', $request->id_member)
                ->orderBy('created_at', 'desc')
                ->first();
                // dd($transaksi_aktivasi->no_struk_transaksi);
                // dd($transaksi_aktivasi_member['no_struk_transaksi']);
            $aktivasi = transaksi_aktivasi_member::create([
                'tgl_aktivasi' => date('Y-m-d H:i:s', strtotime('now')),
                'nominal_aktivasi' => '3000000',
                'no_struk_transaksi' => $transaksi_aktivasi_member['no_struk_transaksi']
            ]);

            //update member tolol
            $member= member::find($request->id_member);
            $member->kadaluarsa_member = date('Y-m-d H:i:s', strtotime('+1 year'));
            $member->save();
                                

        }catch(Exception $e)
        {
            dd($e);
        }
        return response([
            'message'=> 'success tambah data transaksi aktivasi',
            'data' => ['transaksi_member' => $transaksi_member, 'transaksi_aktivasi_member' => $aktivasi, 'member_masa_aktif' => $member->kadaluarsa_member],
        ]);
    
        }
}
