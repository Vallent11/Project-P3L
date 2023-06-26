package com.example.gofit.data.remote

import com.example.gofit.BookingKelasInfo
import com.example.gofit.LoginInstrukturInfo
import com.example.gofit.LoginUserInfo
import com.example.gofit.PasswordInfo
import com.example.gofit.PerizinanInfo
import com.example.gofit.data.remote.response.AddIzinResponse
import com.example.gofit.data.remote.response.BookingKelasResponse
import com.example.gofit.data.remote.response.ChangePasswordResponse
import com.example.gofit.data.remote.response.IzinResponse
import com.example.gofit.data.remote.response.JadwalResponse
import com.example.gofit.data.remote.response.LoginInstrukturResponse
import com.example.gofit.data.remote.response.LoginResponse
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.PUT
import retrofit2.http.Path

interface ApiService {
    @POST("login")
    fun loginUser(
        @Body loginUserInfo : LoginUserInfo
    ) : Call<LoginResponse>

    @POST("loginPegawai")
    fun loginPegawai(
        @Body loginPegawaiInfo : LoginInstrukturInfo
    ) : Call<LoginInstrukturResponse>

    @POST("izin")
    fun addIzin(
        @Body perizinanInfo: PerizinanInfo
    ) : Call<AddIzinResponse>

    @PUT("changePassword/{id}")
    fun changePassword(
        @Path("id") id : Int,
        @Body passwordInfo : PasswordInfo
    ) : Call<ChangePasswordResponse>

    @POST("booking_kelasCoba")
    fun bookingKelas(
        @Body bookingKelas : BookingKelasInfo
    ): Call<BookingKelasResponse>

    @GET("jadwal")
    fun getJadwal() : Call<JadwalResponse>

    @GET("jadwalInstruktur/{username}")
    fun getJadwalInstruktur(
        @Path("username") username : String
    ) : Call<JadwalResponse>

    @GET("izinUsername/{username}")
    fun getIzinInstruktur(
        @Path("username") username : String
    ) : Call<IzinResponse>
}