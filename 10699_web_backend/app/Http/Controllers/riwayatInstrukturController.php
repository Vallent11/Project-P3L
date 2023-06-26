<?php

namespace App\Http\Controllers;

use App\Models\izin_instruktur;
use App\Models\presensi_instruktur;
use App\Models\riwayat_aktivitas_instruktur;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Exception;

class riwayatInstrukturController extends Controller
{
    public static function storeHistoryInstruktur($id_instruktur, $nama_aktivitas, $id_jadwal, $no_booking = null){
        try{
            //* atau gabungin data 
            $historyAktivitas = riwayat_aktivitas_instruktur::create([
                'id_instruktur' => $id_instruktur,
                'nama_aktivitas' => $nama_aktivitas,
                'id_jadwal_harian' => $id_jadwal,
            ]);
            return true;
        }catch(Exception $e){
            dd($e);
            return $e;
        }
    }

    public function showRiwayatByInstruktur(Request $request){
        $riwayatInstruktur = riwayat_aktivitas_instruktur::where('id_instruktur', $request->id_instruktur)
        ->whereBetween('created_at', [Carbon::now()->subWeek(), Carbon::now()])
        ->orderBy('created_at', 'desc')
        ->get();

        return response([
            'data' => $riwayatInstruktur
        ]);
    }


    public function mergeIzinPresensi(Request $request){
    $dataIzin = izin_instruktur::where('id_instruktur', $request->id_instruktur)
    ->with(['jadwalHarian.jadwal_umum.kelas', 'jadwalHarian.izin_instruktur'])
    ->get();

$dataPresensi = presensi_instruktur::where('id_instruktur', $request->id_instruktur)
    ->with(['jadwalHarian.jadwal_umum.kelas'])
    ->get();

$merge = $dataIzin->merge($dataPresensi);
$sorted = $merge->sortByDesc('created_at')->values();

$markedData = $sorted->map(function ($item) {
    if (isset($item['id_presensi'])) {
        $item['jenis_data'] = 'presensi';
    } elseif (isset($item['id_izin'])) {
        $item['jenis_data'] = 'izin';
    }

    return $item;
});

return response([
    'data' => $markedData,
]);
    }
}
