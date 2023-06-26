<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\booking_gym;
use App\Models\booking_kelas;
use App\Models\member;
use Carbon\Carbon;
use Exception;

class bookingKelasController extends Controller
{
    public function getMemberKelasByJadwal($jadwal){
        $booking = booking_kelas::where('id_jadwal_harian', $jadwal)->where('is_canceled', 0 )->with(['member','jadwal_harian'])->get();

        return response(['data' => $booking]);
    }

    public function potongDeposit($noBook){
        $bookingKelas = booking_kelas::with(['jadwal_harian','jadwal_harian.jadwal_umum','jadwal_harian.jadwal_umum.kelas'])->find($noBook);
        $kelas = $bookingKelas->jadwal_harian->jadwal_umum->kelas;
        $member = member::find($bookingKelas->id_member);
        if($member->deposit_paket_member != null && $member->deposit_paket_member > 0){
            // if($kelas->id_kelas )
            $member->deposit_paket_member -= 1;
        }else {
            $member->deposit_uang_member -= $kelas->harga_kelas;
        }
        $member->update();
    }

    public function presensiKelas($noBook){
        $bookingKelas = booking_kelas::find($noBook);
        $bookingKelas->kehadiran_kelas = 1;
        $bookingKelas->update();
        self::potongDeposit($noBook);
        return response(['message' => 'Berhasil Presensi','data'=>$bookingKelas]);
    }

    public function absenKelas($noBook, Request $request){
        $bookingKelas = booking_kelas::find($noBook);
        $bookingKelas->kehadiran_kelas = 0;
        $bookingKelas->update();
        self::potongDeposit($noBook);

        return response(['message' => 'Berhasil Absen','data'=>$bookingKelas]);
    }
}
