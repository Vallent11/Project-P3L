<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\jadwal_umum;
use App\Models\jadwal_harian;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Validator;

class jadwalHarianController extends Controller
{
    public function cekAutoGenerate(){
        $jadwalHarian = jadwal_harian::where('tgl_jadwal_harian', '>', Carbon::now()->startOfWeek(Carbon::SUNDAY)->format('Y-m-d'))
            ->first();
        if(is_null($jadwalHarian)){
            return false;
        }else{
            return true;
        }
    }
    public function index()
    {

        //* find all data
        $start_date = Carbon::now()->startOfWeek(Carbon::SUNDAY);

        $jadwal = [$start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
        $start_date->addDay()->toDateString() => jadwal_harian::whereDate('tgl_jadwal_harian',$start_date)->with(['jadwal_umum','jadwal_umum.instruktur','jadwal_umum.kelas','izin_instruktur','izin_instruktur.instruktur','izin_instruktur.instrukturPengganti'])->get(),
    ];
        return response([
        //* return response
            'message'=>'Success Tampil Data',
            'data' => $jadwal
        ],200); 

    }

    public function findData(Request $request)
    {
        $start_date = Carbon::now()->startOfWeek(Carbon::SUNDAY)->addDay();
        $end_date =  Carbon::now()->startOfWeek(Carbon::SUNDAY)->addDays(7);
    }
    
    
    public function store()
    {
        
        if(self::cekAutoGenerate()){
            return response()->json([
                'success' => false,
                'message' => 'Jadwal harian minggu ini sudah di generate',
                'data' => null,
            ], 400);
        }
        $start_date = Carbon::now()->startOfWeek(Carbon::SUNDAY)->addDay();
        $end_date =  Carbon::now()->startOfWeek(Carbon::SUNDAY)->addDays(7);
        $mapHari = [
            'monday' => 'senin',
            'tuesday' => 'selasa',
            'wednesday' => 'rabu',
            'thursday' => 'kamis',
            'friday' => 'jumat',
            'saturday' => 'sabtu',
            'sunday' => 'minggu'
        ];
        for($date = $start_date; $date->lte($end_date); $date->addDay()){
            $hari_jadwal = Carbon::parse($date)->format('l');
            $jadwalUmum = DB::table('jadwal_umum')
            ->where('jadwal_umum.hari_jadwal', '=', $mapHari[strtolower($hari_jadwal)])
            ->get();
            // menyimpan data ke tabel jadwal_harian
            foreach ($jadwalUmum as $jadwal) {
                
                $jadwalHarian = DB::table('jadwal_harian')
                ->where('tgl_jadwal_harian', '=', $date->toDateString())
                ->where('id_jadwal_umum', '=', $jadwal->id_jadwal_umum)
                ->first();
                // jika belum ada, maka dilakukan insert
                if (!$jadwalHarian) {
                    DB::table('jadwal_harian')->insert([
                        'tgl_jadwal_harian' => $date->toDateString(),
                        'status' => 'berjalan',
                        'id_jadwal_umum' => $jadwal->id_jadwal_umum,
                    ]);
            } 
        }
    }
        //*return response
        return response([
        ]);  
    }

    public function update(Request $request, $id)
    {
        //* Validasi
        $validator = Validator::make($request->all(), [
            'hari_jadwal' => 'required',
            'jam_mulai' => 'required',
            'jam_selesai' => 'required',
            'id_instruktur' => 'required',
            'id_kelas' => 'required',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(),422);
        }
    
        //* Cari data berdasarkan ID
        $temp = jadwal_umum::where('id_jadwal_umum', $id)->first();
        if (!$temp) {
            return response()->json([
                'success' => false,
                'message' => 'Data not found',
            ], 404);
        }
    
        //* Update data
        jadwal_umum::where('id_jadwal_umum', $id)->update([
            'hari_jadwal' => $request->hari_jadwal,
            'id_instruktur' => $request->id_instruktur,
            'id_kelas' => $request->id_kelas,
            'jam_mulai' => $request->jam_mulai,
            'jam_selesai' => $request->jam_selesai,
        ]);
    
        //* Berikan respon sukses
        return response()->json([
            'success' => true,
            'message' => 'Jadwal Umum Updated',
            'data'    => jadwal_umum::find($id),
        ], 200);
    }
    

    public function destroy($id)
    {
        //* Find Data based on params $id
        $jadwal_umum = jadwal_umum::Where('id_jadwal_umum',$id)->first();
        //*found
        if($jadwal_umum){
            $jadwal_umum->delete();
            
            return response()->json([
                'success' => true,
                'message' => 'jadwal_umum Deleted',
            ], 200);
            
        //*not found
        }else{
            return response()->json([
                'success' => false,
                'message' => 'jadwal_umum Not Found',
            ], 404);
        }   
    }


    public function updateLibur($id){
        $jadwal_harian = jadwal_harian::find($id);
        $jadwal_harian->status = 'diliburkan';
        $jadwal_harian->save();
        return response()->json(['message' => 'Jadwal Harian berhasil diliburkan'], 200);
    }
}