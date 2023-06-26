<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\instruktur;
use App\Http\Controllers\penggunaController;
use App\Models\pengguna;
use Exception;
use Validator;

class instrukturController extends Controller
{
    public function index()
    {
        $instruktur = instruktur::with(['pengguna'])->get();

        return response([
            'message'=>'success menampilkan data',
            'data' => $instruktur
        ],200); 
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_instruktur' => 'required',
            'tgl_lahir_instruktur' => 'required',
            'alamat_instruktur' => 'required',
            'no_telp_instruktur' => 'required',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(),422);
        }
        //* Register
        $idPengguna = penggunaController::register($request->all('username'),$request->all('password'),'instruktur');

        try{
            $instruktur = instruktur::create([
                'id_pengguna' => $idPengguna,
                'nama_instruktur' => $request->nama_instruktur,
                'tgl_lahir_instruktur' => $request->tgl_lahir_instruktur,
                'alamat_instruktur' => $request->alamat_instruktur,
                'no_telp_instruktur' => $request->no_telp_instruktur
            ]);
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
                'data' => $instruktur,
            ]);
        }

    public function show($id)
    {
        $instruktur = instruktur::Where('id_instruktur',$id)->with(['pengguna'])->get();
        return response([
            'message' => 'success tampil',
            'data' => $instruktur
        ],200);   
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'nama_instruktur' => 'required',
            'tgl_lahir_instruktur' => 'required',
            'alamat_instruktur' => 'required',
            'no_telp_instruktur' => 'required',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(),422);
        }
        
        $instruktur = Instruktur::findOrFail($id);
        $instruktur->nama_instruktur = $request->nama_instruktur;
        $instruktur->tgl_lahir_instruktur = $request->tgl_lahir_instruktur;
        $instruktur->alamat_instruktur = $request->alamat_instruktur;
        $instruktur->no_telp_instruktur = $request->no_telp_instruktur;
        $instruktur->save();

            return response()->json([
                'success' => true,
                'message' => 'Instruktur Updated',
                'data'    => $instruktur  
            ], 200);
        }
    public function destroy($id)
    {
        $instruktur = instruktur::Where('id_instruktur',$id)->first();
        if($instruktur){
            $idPengguna = $instruktur->id_pengguna;
            $instruktur->delete();
            penggunaController::destroyPengguna($idPengguna);

            return response()->json([
                'success' => true,
                'message' => 'instruktur Deleted',
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'instruktur Not Found',
            ], 404);
        }    
    }
}
