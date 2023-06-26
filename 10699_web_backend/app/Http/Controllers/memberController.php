<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\member;
// use Illuminate\Validation\Rules\Exists;
use App\Http\Controllers\penggunaController;
use App\Models\pengguna;
use Exception;
use Validator;

class memberController extends Controller
{
    public function formatDate($date){
        $formattedDate = Carbon::parse($date)->format('d/m/Y');
        return $formattedDate;
    }
    public function index()
    {
        $member = member::with(['pengguna'])->get();

        return response([
            'message'=>'Success Menampilkan Data',
            'data' => $member
        ],200); 
    }

    public function show($id)
    {
        $member = member::Where('id_member',$id)->with(['pengguna'])->get();
        return response([
            'message' => 'success tampil',
            'data' => $member
        ],200);   
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_member' => 'required',
            'tgl_lahir_member' => 'required',
            'no_telp_member' => 'required',
            'alamat_member' => 'required',
            'email' => 'required',

            // 'kadaluarsa_member' => 'required',
            'deposit_uang_member' => 'required',
            'deposit_paket_member' => 'required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(),422);
        }
        
        //* Register
        $idPengguna = penggunaController::register('-','password','member');
        // $password = self::formatDate($request->tgl_lahir_member);
        // $idPengguna = penggunaController::register($request->get('username'),$request->get('password'),'member');
        
        try{
            $member = member::create([
                'id_pengguna' => $idPengguna,
                'nama_member' => $request->nama_member,
                'tgl_lahir_member' => $request->tgl_lahir_member,
                'no_telp_member' => $request->no_telp_member,            
                'alamat_member' => $request->alamat_member,
                'email' => $request->email,

                'kadaluarsa_member' => $request->kadaluarsa_member,
                'deposit_uang_member' => $request->deposit_uang_member,
                'deposit_paket_member' => $request->deposit_paket_member,         
            ]);
        $find = member::where('id_pengguna',$idPengguna)->first();
        penggunaController::updateUsername($idPengguna,$find->id_member);
        }catch(Exception $e)
        {
            penggunaController::destroyPengguna($idPengguna);
            return response([
                'message' => "Registrasi Gagal",
                'data' => $e->getMessage()
            ],400);
        }
            
            return response([
                'message'=> 'success menambahkan data ',
                'data' => $member,
            ]);
        }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama_member' => 'required',
            'tgl_lahir_member' => 'required',
            'no_telp_member' => 'required',
            'alamat_member' => 'required',
            'email' => 'required',

            // 'kadaluarsa_member' => 'required',
            'deposit_uang_member' => 'required',
            'deposit_paket_member' => 'required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(),422);
        }
        
            $member = Member::findOrFail($id);
            $member->nama_member = $request->nama_member;
            $member->tgl_lahir_member = $request->tgl_lahir_member;
            $member->no_telp_member = $request->no_telp_member;
            $member->alamat_member = $request->alamat_member;
            $member->email = $request->email;

            $member->kadaluarsa_member = $request->kadaluarsa_member;
            $member->deposit_uang_member = $request->deposit_uang_member;
            $member->deposit_paket_member = $request->deposit_paket_member;
            $member->save();

            return response()->json([
                'success' => true,
                'message' => 'Member Updated',
                'data'    => $member
            ], 200);
    }

    public function destroy($id)
    {
        $member = member::Where('id_member',$id)->first();
        if($member){
            $idPengguna = $member->id_pengguna;
            $member->delete();
            penggunaController::destroyPengguna($idPengguna);

            return response()->json([
                'success' => true,
                'message' => 'member Deleted',
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'member Not Found',
            ], 404);
        } 
    }
    public function updateExpireDate($id)
    {
        $member = member::where('id_member', $id)->first();
        if ($member->tgl_kadeluarsa_aktivasi == null) {
            $tgl_aktivasi = date('Y-m-d H:i:s'); // jika kosong, gunakan tanggal hari ini
        } else {
            $tgl_aktivasi = $member->tgl_kadeluarsa_aktivasi; // gunakan tanggal aktivasi yang ada di database
        }
        // tambahkan 1 tahun
        $tgl_kadaluarsa = date('Y-m-d H:i:s', strtotime('+1 year', strtotime($tgl_aktivasi)));
        $member->tgl_kadeluarsa_aktivasi = $tgl_kadaluarsa;
        $member->save();
            return response()->json([
            'success' => true,
            'message' => 'Tanggal Kadaluarsa Member berhasil diupdate',
            'tgl_kadaluarsa' => $tgl_kadaluarsa,
        ], 200);
    }

    public function updateTotalDeposit($id, Request $request)
    {   
        $member = member::where('id_member', $id)->first();
        // dd($member);
        $total_deposit = $member->deposit_uang_member;
        $total_deposit +=  $request->total_deposit; 
        $member->deposit_uang_member = $total_deposit;
        $member->save();
        return response()->json([
            'success' => true,
            'message' => 'Deposit Member berhasil diupdate',
        ], 200);
    }



    public function memberKadeluarsa()
                {
        $today = Carbon::today();

        $members = Member::where('kadaluarsa_member', '<', $today)
                          ->with(['pengguna'])
                          ->get();
        return response([   
            'message'=>'Success Tampil Data',
            'data' => $members
        ],200); 

    }

    public function depositkadeluarsa()
    {
        $today = Carbon::today();

        $members = Member::where('kadaluarsa_paket', '<', $today)
                          ->get();
        return response([
            'message'=>'Success Tampil Data',
            'data' => $members
        ],200); 

    }

    public function memberDeaktivasi()
    {
        $today = Carbon::today();

        $members = Member::where('kadeluarsa_member', '<', $today)
                          ->with(['pengguna'])
                          ->get();


        foreach ($members as $member) {
        $member->fill([
                'kadaluarsa_member' => null,
                'deposit_uang_member' => 0,
                'kadaluarsa_paket' => null,
                // add more attributes to reset to 0 as necessary
                
            ]);
        $member->save();
    }
    return response([
        'message'=>'Success Deaktivasi Member',
        'data' => $members
    ],200); 
    }

    public function resetDeposit()
    {
        $today = Carbon::today();

        $members = Member::where('kadaluarsa_paket', '<', $today)
        ->get();


        foreach ($members as $member) {
        $member->fill([
                'deposit_paket_member' => 0,
                'kadaluarsa_paket' => null,
            ]);
        $member->save();
    }
    return response([
        'message'=>'Success Reset Deposit Member',
        'data' => $members
    ],200); 
    }
}
