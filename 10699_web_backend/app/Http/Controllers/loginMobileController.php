<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use App\Models\Pegawai;
use App\Models\Instruktur;
use App\Models\Member;

class loginMobileController extends Controller
{
    public function loginMobileController(Request $request)
    {
        $dataForm = $request->only(['username','password']);

        if(!Auth::guard('api')->attempt($dataForm))
            return response(['message' => 'invalid credentials'],400);

        $user = Auth::user();
        $token = $user->createToken('Authentication Token')->accessToken;

        $pegawai = pegawai::Where('id_pengguna',$user->id_pengguna)->get();

        if($user->role == 'admin' || $user->role == 'kasir' || $user->role == 'mo' ){

            return response([
                'message' => 'Autenthicated',
                'user' => $user,
                'siganteng' => $pegawai[0],
                'token_type' => 'Bearer',
                'access_token' => $token
            ]);
        }
        if($user->role == 'instruktur'){
            $instruktur = instruktur::where('id_pengguna',$user->id_pengguna)->first();

        return response([
            'message' => 'Autenthicated',
            'user' => $user,
            'instruktur' => $instruktur,
            'token_type' => 'Bearer',
            'access_token' => $token
        ]);
        }

        //* Role Member
        if($user->role == 'member'){
            $member = member::where('id_pengguna',$user->id_pengguna)->first();

            return response([
                'message' => 'Autenthicated',
                'user' => $user,
                'member' => $member,
                'token_type' => 'Bearer',
                'access_token' => $token
            ]);
            }
        
}
}
