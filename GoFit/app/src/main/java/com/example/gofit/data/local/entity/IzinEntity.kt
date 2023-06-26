package com.example.gofit.data.local.entity

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class IzinEntity (
    var izinID : Int,
    var tanggal : String,
    var sesi : String,
    var instruktur : String) : Parcelable