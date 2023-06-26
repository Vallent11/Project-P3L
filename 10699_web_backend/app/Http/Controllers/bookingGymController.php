<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\booking_gym;
use App\Models\member;
use Carbon\Carbon;
use Exception;
class bookingGymController extends Controller
{
    public function cekNotKadeluarsa($id){
        $member = member::find($id);
        if($member->kadeluarsa_member == null || $member->kadaluarsa_member < Carbon::now() ){
            return false;
        }
        return true;
    }

    // public function cekMemberActive($id){
    //     $member = member::find($id);
    //     if($member->tgl_kadeluarsa_aktivasi == null || $member->tgl_kadeluarsa_aktivasi < Carbon::now() ){
    //         return false;
    //     }
    //     return true;
    // }

    public function cekAlreadyBookingToday($tanggalBooking, $member){
        // dd($tanggalBooking);
        $daftarBooking = booking_gym::where('tgl_booking_gym', $tanggalBooking )->where('id_member',$member)->count();
        if($daftarBooking == 0){
            return false;
        }
        return true;
    }

    public function cekKuotaIsFull($tanggalSesi , $idSesi){
        $daftarBooking = booking_gym::where('tanggal_sesi_gym', $tanggalSesi )->where('id_sesi',$idSesi)->count();
        // $request->tanggal_sesi_gym
        if($daftarBooking < 10 ){
            return true;
        }
        return false;
    }

    public function cekBookingSame($tanggalSesi , $idSesi, $idMember){
        $daftarBooking = booking_gym::where('tanggal_sesi_gym', $tanggalSesi )->where('id_sesi',$idSesi)->where('id_member',$idMember)->count();
        
        //*Debugging
        // dd($tanggalSesi,$idSesi, $idMember, $daftarBooking);
        
        if($daftarBooking == 0 ){
            //* tidak ada yang sama
            return false;
        }
        //* ada yang sama
        return true;
    }
    
    public function index()
    {
        //
    }
    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //* Cek Status Aktif Member
        if(!self::cekNotKadeluarsa($request->id_member)){
            return Response(['message' => 'Akun Anda Sudah Kadeluarsa'],400);
        }
        //* Cek  Kuota
        if(!self::cekKuotaIsFull($request->tanggal_sesi_gym , $request->id_sesi)){
            return Response(['message' => 'Kuota Telah Penuh'],400);
        }
        // self::cekBookingSame(Carbon::today(),1,$request->id_member);
        //* Cek Apakah Member sudah pernah melakukan booking pada hari yang sama
        if(self::cekAlreadyBookingToday(Carbon::today(),$request->id_member)){
            return Response(['message' => 'Anda Telah Melakukan Booking Untuk Hari ini'],400);
        }
        //* Cek Apakah Booking Sama
        if(self::cekBookingSame($request->tanggal_sesi_gym,$request->id_sesi,$request->id_member)){
            return Response(['message' => 'Anda Telah Melakuakn Booking pada sesi dan tanggal ini'],400);
        }
        //* Apakah Member melakukan Booking pada Hari yang sama (Sama kayak diatas tp tidak perlu sesi)

        try{
            $booking = booking_gym::create([
                'id_member' => $request->id_member,
                'tgl_booking_gym' => Carbon::now(),
                'tanggal_sesi_gym' => $request->tanggal_sesi_gym,
                'id_sesi' => $request->id_sesi,
            ]);
            
            return response([
                'message' => 'Berhasil Booking',
                'data' => $booking]);
        }catch(Exception $e){
            dd($e);
        }   
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function showData(Request $request){
        $bookingGym = booking_gym::where('id_member', $request->id_member)->where('is_canceled', 0)->with(['sesi'])->get();

        return(response(['data' => $bookingGym]));
    }



    public function cancelBookingGym($noBook){
        //* Cari Data yang sesuai dengan nomor Booking
        $bookingGym = booking_gym::find($noBook);
        //* Cek minimal cancel h-1 Tanggal_Sesi_Gym - 1 
        $today = Carbon::today();
        $batasCancel = Carbon::parse($bookingGym->tanggal_sesi_gym)->subDay();
        if($batasCancel->greaterThanOrEqualTo($today)){
            // dd($today->toDateString(), $batasCancel->toDateString());
            // dd($today->gte());
            //* Ubah is_canceled -> true
            $bookingGym->is_canceled =  1;
            $bookingGym->update();
            //* Response
            return response(
                [
                    'message' => 'Berhasil Membatalkan',
                    'data' => $bookingGym
                ]);
        }else{
            return response(['message' => 'Tidak bisa membatalkan, maksimal pembatalan H-1'],400);
        }
    }
}
