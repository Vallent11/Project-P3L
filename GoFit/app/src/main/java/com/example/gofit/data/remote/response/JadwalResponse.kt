package com.example.gofit.data.remote.response

import com.google.gson.annotations.SerializedName
import java.util.Date


//untuk get jadwal
data class JadwalResponse(

	@field:SerializedName("data")
	val data: List<Jadwal>,

	@field:SerializedName("message")
	val message: String
)

data class Jadwal(

	@field:SerializedName("pegawaiID")
	val pegawaiID: Int,

	@field:SerializedName("instruktur")
	val instruktur: String?,

	@field:SerializedName("jadwalID")
	val jadwalID: Int,

	@field:SerializedName("tanggal")
	val tanggal: String,

	@field:SerializedName("kapasitas")
	val kapasitas: Int,

	@field:SerializedName("tipe")
	val tipe: String,

	@field:SerializedName("sesi")
	val sesi: String
)
