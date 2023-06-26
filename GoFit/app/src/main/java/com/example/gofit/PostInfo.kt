package com.example.gofit

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.util.Date

data class LoginUserInfo(
    val username : String,
    val password : String
)

data class LoginInstrukturInfo(
    val username : String,
    val password : String
)

data class PerizinanInfo(
    val jadwalID : Int,
    val sesi : String,
    val tanggal_izin : String,
    val username : String,
    val instruktur : String
)

data class PasswordInfo(
    val password: String
)

data class BookingKelasInfo(
    val memberID: Int,
    val jadwalID: Int,
    val username: String,
    val sesi: String,
    val tanggal : String
)

@Parcelize
data class BookingKelasData(
    val jadwalID: Int,
    val sesi: String,
    val tanggal : String
) : Parcelable