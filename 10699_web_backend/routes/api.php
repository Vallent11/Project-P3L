<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Spatie\FlareClient\Api;
use App\Http\Controllers\loginController;
use App\Http\Controllers\instrukturController;
use App\Http\Controllers\kelasController;
use App\Models\kelas;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post ('loginWeb', 'loginController@loginWebsiteController');
Route::post ('register', 'loginController@registerPengguna');
Route::post('loginMobile', 'loginMobileController@loginMobileController');

route::apiResource('/kelas', 'kelasController');
Route::get('/passReset/{id}', 'pelangganController@updatedata');
Route::apiResource('/instruktur', 'instrukturController');
Route::apiResource('/member', 'memberController');
Route::apiResource('/promo', 'promoController');
Route::apiResource('/pengguna', 'penggunaController');
Route::apiResource('/jadwalumum', 'jadwalUmumController');
Route::apiResource('/jadwalharian', 'jadwalHarianController');
Route::post('/jadwalharianfind', 'jadwalHarianController@findData');
Route::get('/jadwalharianlibur/{id}', 'jadwalHarianController@updateLibur');
Route::apiResource('/izininstruktur', 'izinInstrukturController');  

Route::apiResource('/presensigym', 'presensiGymController');  
Route::post('/cetakstrukgym/{noBooking}', 'presensiGymController@generateStrukTansaksi');  
Route::post('/cetakstrukkelas/{noBooking}', 'presensiKelasController@generateStrukTansaksi');  
Route::apiResource('/presensikelas', 'presensiKelasController');  
Route::apiResource('/bookinggym', 'bookingGymController');  

Route::post('/hitungtransaksi', 'transaksiController@countTransaction');
Route::get('/transaksihariini' , 'transaksiController@todayTransaction');
Route::apiResource('/transaksiaktivasi', 'aktivasiController');  
Route::apiResource('/transaksideposituang', 'depositUangController');  
Route::apiResource('/transaksidepositpaket', 'depositPaketController');
Route::get('/td-deposituang', 'depositUangController@todayTransaction'); 

Route::get('/riwayataktivitasmember', 'riwayatMemberController@showRiwayatByMember');
Route::get('/riwayataktivitasinstruktur', 'riwayatInstrukturController@showRiwayatByInstruktur');
//* History by merge presensi dan ijin
Route::get('/riwayataktivitasinstrukturmerge', 'riwayatInstrukturController@mergeIjinPresensi');

//* Laporan Aktivitas
Route::get('laporanaktivitasgym','laporanController@aktivitasGymBulanan');
Route::get('laporanaktivitaskelas','laporanController@aktivitasKelasBulanan');
Route::get('laporankinerjainstruktur','laporanController@kinerjaInstrukturBulanan');
Route::get('laporanpendapatantahunan','laporanController@laporanPendapatanPerTahun');