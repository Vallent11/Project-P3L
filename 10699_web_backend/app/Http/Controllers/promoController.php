<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\promo;
use Illuminate\Support\Facades\Validator;

class promoController extends Controller
{
    function index(){
        $promo = promo::latest()->get();
        return response(
            [
                'message' => 'Berhasil Show Promo',
                'promo' => $promo
            ],200
        );
    }

    function show($key)
    {
        $promo = promo::get($key);
        return response(
            [
                'message' => 'Berhasil Show Sesi Gym',
                'sesiGym' => $promo
            ],200
        );
    }
}
