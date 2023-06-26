package com.example.gofit.data.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Jadwal (
    var jadwalID : Int,
    var pegawaiID : Int,
    var tipe : String,
    var sesi : String,
    var tanggal : String,
        ) : Parcelable