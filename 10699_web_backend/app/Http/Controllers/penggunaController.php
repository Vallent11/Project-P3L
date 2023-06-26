<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\pengguna;
use Illuminate\Support\Facades\Hash;

class penggunaController extends Controller
{
    public static function register($username, $password, $role)
    {
        $regisData["username"] = $username;
        $regisData["password"] = $password;
        $regisData["role"] = $role;
        
        $regisData['password'] = bcrypt($regisData['password']);
        $pengguna = pengguna::create($regisData);
        return $pengguna->id_pengguna;
    }

    public static function updateUsername($key,$username)
    {
        $temp = pengguna::where('id_pengguna',$key)->first();
        $temp->update([
            'username' => $username,
        ]);
    }

    public function update(Request $request, $id)
    {
        $pengguna = pengguna::find($id);
        $newPassword = bcrypt($request->tgl_lahir_member);
        $pengguna->password = $newPassword; 
        $pengguna->save();
        return response()->json([
            'success' => true,
            'message' => 'Password Berhasil Direset'
        ],200);
    }

    public static function destroyPengguna($id)
    {
        $pengguna = pengguna::find($id);
        if($pengguna){
            $pengguna->delete();
            return response()->json([
                'success' => true,
                'message' => 'pengguna deleted'
            ],200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'pengguna not found'
            ],200);
        }
    }
    public function ResetPassword(Request $request){
        $pengguna = pengguna::find($request->id_pengguna);
        $oldPw = $request->old_pw;
        
        if(Hash::check($oldPw, $pengguna->password)){
            $pengguna->password = bcrypt($request->new_pw);
            $pengguna->save();
            return response([
                'message'=>'success mengganti password'
            ],200);
        }else{
            return response([],400);
        }

    }
}
