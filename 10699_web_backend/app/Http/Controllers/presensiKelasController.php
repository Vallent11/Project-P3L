<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\booking_kelas;
use App\Models\jadwal_harian;
use App\Models\transaksi_member;
use App\Models\member;

class presensiKelasController extends Controller
{
    public function index()
    {   
        $presensi_kelas = booking_kelas::with(['jadwal_harian','jadwal_harian.jadwal_umum'])->where('is_canceled',0)->get();
        return response([
            'message' => 'success tampil data',
            'data' => $presensi_kelas
        ],200);
    }

    public function update(Request $request, $id)
    {
        $presensi_kelas = booking_kelas::find($id);
        $presensi_kelas->kehadiran_kelas = $request->kehadiran_kelas; 
        $presensi_kelas->save();  
        return response()->json([
            'success' => true,
            'message' => 'Konfirmasi Kehadiran Berhasil dilakukan'
        ],200);
    }
    /**
     * Show the form for creating a new resource.
     *  
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    
    public function generateStrukTansaksi($noBooking, Request $request){
        //* Cari Data Booking yang telah ada
        $dataBooking = booking_kelas::with(['jadwal_harian','member','jadwal_harian.jadwal_umum.kelas','jadwal_harian.jadwal_umum.instruktur'])->find($noBooking);
        $member = $dataBooking->member;
        $jenisTransaksi = 'Aktivasi Member';
        if($member->deposit_paket_member != null && $member->deposit_paket_member > 0){
            $jenisTransaksi = 'Paket Kelas';
        }
        // if ($member != null && $member->deposit_paket_member != null && $member->deposit_paket_member > 0) {
        //     $jenisTransaksi = 'Paket Kelas';
        // }
        
        

        $transaksi_member = transaksi_member::create([
            'jenis_transaksi' => $jenisTransaksi,
            'id_pegawai' =>  $request->id_pegawai,
            'id_member' => $dataBooking->id_member
        ]);

        $dataLatest = transaksi_member::latest()->first();
        $no_struk_transaksi = $dataLatest->no_struk_transaksi; 
        $dataBooking->no_struk_transaksi =  $no_struk_transaksi;
        $dataBooking->update();

        return response(['message' => 'Sukses mencetak struk',
                        'data' => $dataBooking,
                        'transaksi' => $transaksi_member]);
    }
}
