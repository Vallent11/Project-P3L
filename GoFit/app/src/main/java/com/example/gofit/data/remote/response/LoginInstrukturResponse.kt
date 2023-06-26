package com.example.gofit.data.remote.response

data class LoginInstrukturResponse(
	val accessToken: String,
	val message: String,
	val tokenType: String,
	val user: LoginInstruktur
)

data class LoginInstruktur(
	val pegawaiID: Int,
	val password: String,
	val telp: String,
	val updatedAt: String,
	val roleID: Int,
	val namaRole: String,
	val createdAt: String,
	val tanggalLahir: String,
	val username: String,
	val alamat: String
)

