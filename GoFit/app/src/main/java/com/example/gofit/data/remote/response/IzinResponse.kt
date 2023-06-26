package com.example.gofit.data.remote.response

import com.google.gson.annotations.SerializedName

data class IzinResponse(

	@field:SerializedName("data")
	val data: List<DataItem>,

	@field:SerializedName("message")
	val message: String
)

data class DataItem(

	@field:SerializedName("is_accepted")
	val isAccepted: Int,

	@field:SerializedName("tanggal_izin")
	val tanggalIzin: String,

	@field:SerializedName("instruktur")
	val instruktur: String,

	@field:SerializedName("izinID")
	val izinID: Int,

	@field:SerializedName("updated_at")
	val updatedAt: String,

	@field:SerializedName("jadwalID")
	val jadwalID: Int,

	@field:SerializedName("created_at")
	val createdAt: String,

	@field:SerializedName("sesi")
	val sesi: String,

	@field:SerializedName("username")
	val username: String
)
