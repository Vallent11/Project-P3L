package com.example.gofit.data.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "jadwal")
class JadwalEntity (
    @field:ColumnInfo(name = "jadwalID")
    @PrimaryKey
    val jadwalID : Int,

    @field:ColumnInfo(name = "tipe")
    val tipe : String,

    @field:ColumnInfo(name = "sesi")
    val sesi : String,

    @field:ColumnInfo(name = "tanggal")
    val tanggal : String,

    @field:ColumnInfo(name = "kapasitas")
    val kapasitas : Int,

    @field:ColumnInfo(name = "instruktur")
    val instruktur : String?
)