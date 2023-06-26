<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\pengguna;
use App\Models\pegawai;
use App\Http\Controllers\pegawaiController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class loginController extends Controller
{
    public function loginWebsiteController(Request $request)
    {
        $dataForm = $request->only(['username','password']);

        if(!Auth::guard('api')->attempt($dataForm))
            return response(['message' => 'invalid credentials'],400);

        $user = Auth::user();
        $token = $user->createToken('Authentication Token')->accessToken;

        $pegawai = pegawai::Where('id_pengguna',$user->id_pengguna)->get();

        if($user->role == 'admin' || $user->role == 'kasir' || $user->role == 'mo' ){
            // $pegawai = pegawai::where('id_pengguna',$user->id_pengguna)->first();
            // dd($pegawai);
            return response([
                'message' => 'Autenthicated',
                'user' => $user,
                'siganteng' => $pegawai[0],
                'token_type' => 'Bearer',
                'access_token' => $token
            ]);
        }
        return response(['message' => 'invalid credentials'],400);
    }

    public function registerPengguna(Request $request)
    {
        $dataRegis = $request->all();
        $dataRegis['password'] = bcrypt($request->password);
        //* Bikin si pengguna
        $pengguna = pengguna::create($dataRegis);


        //* Bikin si pegawai
        $id_pengguna = $pengguna->id_pengguna;
        $dataRegisPegawai = pegawai::create([
            'nama_pegawai' => $request->nama_pegawai,
            'alamat_pegawai' => $request->alamat_pegawai,
            'tgl_lahir_pegawai' => $request->tgl_lahir_pegawai,
            'no_telp_pegawai' => $request->no_telp_pegawai,
            'id_pengguna' => $id_pengguna
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Register Pengguna',
            'data'    => $dataRegis
        ], 200);
    

    }
}