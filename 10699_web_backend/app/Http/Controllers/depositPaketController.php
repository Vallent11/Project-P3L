<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\transaksi_member;
use App\Models\transaksi_deposit_paket;
use App\Models\kelas;
use App\Models\member;
use App\Models\promo;
use Exception;
use Carbon\Carbon;

class depositPaketController extends Controller
{
    public function store(Request $request)
    {
    try{
        //* try dlu disini
        //cek nominalDeposit > promo[where id.promo].minimal.deposit
        $id_promo = null;
        $masa_berlaku = null;   
        $member = member::findOrFail($request->id_member);
        if($member->total_deposit_paket != 0 && $member->tgl_kadaluarsa_paket != null){
            return response()->json([
                'success' => false,
                'message' => 'Saldo Anda Belum Habis, Anda Belum Bisa melakukan transaksi lagi',
                'data' => null
            ], 401);
        }
        if($request->id_promo != null){
            //* jika memakai promo
            $promo = promo::findorfail($request->id_promo);
            $minimal_deposit = $promo->minimal_deposit_kelas;
            $nominal_deposit = $request->nominal_deposit_kelas;
            $total_deposit = $request->nominal_deposit_kelas;
            //* pengecekan berdasarkan response apakah benar-benar layak mendapatkan promo
            if($minimal_deposit < $nominal_deposit){
                $id_promo = $promo->id_promo;
                $total_deposit += $promo->bonus_promo;
                $masa_berlaku = $promo->masa_berlaku;
            }else{
                $id_promo = null;
                $masa_berlaku = null;
            }
        }else{
            //* tidak menggunakan promo
            $nominal_deposit = $request->nominal_deposit_kelas;
            $total_deposit = $nominal_deposit;
            $masa_berlaku = 1;
        }
        // dd($total_deposit);              

        //* Create Transaksi Member
        $transaksi_member = transaksi_member::create([
            'jenis_transaksi' => 'transaksi-deposit-paket',
            'id_pegawai' => $request->id_pegawai,
            'id_member' => $request->id_member,
        ]);
        
        //* Ngambil Dapat Transaksi dari tabel transaksi_member yang baru dilakukan
        
        $transaksi_deposit_paket = transaksi_member::where('jenis_transaksi', '=', 'transaksi-deposit-paket')
        ->where('id_pegawai', '=', $request->id_pegawai)
        ->where('id_member', '=', $request->id_member)
        ->orderBy('created_at', 'desc')
        ->first();
        
        //* id_deposit_paket	tanggal_deposit	nominal_deposit_kelas	nominal_uang	tanggal_kadeluarsa	id_promo	no_struk	id_kelas	
        $depositPaket = transaksi_deposit_paket::create([
            'tanggal_deposit' => now(),
            'id_pegawai' => $request->id_pegawai,
            'id_promo' => $id_promo,
            'nominal_deposit_kelas' =>$nominal_deposit,
            'nominal_uang' => $request->nominal_uang,
            'id_kelas' => $request->id_kelas,
            'id_member' => $request->id_member,
            'no_struk' => $transaksi_deposit_paket['no_struk_transaksi'],
            'tanggal_kadaluarsa' => Carbon::now()->addMonth($masa_berlaku)
        ]);

        // $member = member::where('id_member', $request->id_member)->first();
        $member->total_deposit_paket = $nominal_deposit;
        $member->tgl_kadaluarsa_paket = Carbon::now()->addMonth($masa_berlaku);
        $member->save();
        }catch(Exception $e)
        {
            dd($e);
        }
        
        $kelas = kelas::findOrFail($request->id_kelas);
        return response([
            'message' => 'Berhasil Melakukan Transaksi',
            'data' => ['member' => $member , 'transaksi_member'=>$transaksi_member,'transaksi_deposit_paket' => $depositPaket, 'kelas' => $kelas]
        ]);
    }
}