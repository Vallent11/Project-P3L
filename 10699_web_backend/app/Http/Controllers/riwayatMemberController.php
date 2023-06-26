<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\riwayat_aktivitas_member;
use Exception;
use Carbon\Carbon;

class riwayatMemberController extends Controller
{
    public static function storeHistory($id_member, $nama_aktivitas, $no_struk_transaksi = null, $no_booking = null){
        try{
            $historyAktivitas = riwayat_aktivitas_member::create([
                'id_member' => $id_member,
                'nama_aktivitas' => $nama_aktivitas,
                'tanggal' => Carbon::now(),
                'no_struk_transaksi' => $no_struk_transaksi,
                'no_booking' => $no_booking,
            ]);
            return true;
        }catch(Exception $e){
            dd($e);
            return $e;
        }
    }

    public function showRiwayatByMember(Request $request){
        $riwayatMember = riwayat_aktivitas_member::where('id_member', $request->id_member)
        ->whereBetween('created_at', [Carbon::now()->subWeek(), Carbon::now()])
        ->orderBy('created_at', 'desc')
    ->get();

        
        return response([
            'data' => $riwayatMember
        ]);
    }
}
