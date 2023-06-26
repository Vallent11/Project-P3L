package com.example.gofit.data.remote.response

import com.google.gson.annotations.SerializedName

data class AddIzinResponse(

	@field:SerializedName("data")
	val data: DataIzin,

	@field:SerializedName("message")
	val message: String
)

data class DataIzin(

	@field:SerializedName("tanggal_izin")
	val tanggalIzin: String,

	@field:SerializedName("instruktur")
	val instruktur: String,

	@field:SerializedName("updated_at")
	val updatedAt: String,

	@field:SerializedName("izinID")
	val izinID: Int,

	@field:SerializedName("jadwalID")
	val jadwalID: String,

	@field:SerializedName("created_at")
	val createdAt: String,

	@field:SerializedName("sesi")
	val sesi: String
)
