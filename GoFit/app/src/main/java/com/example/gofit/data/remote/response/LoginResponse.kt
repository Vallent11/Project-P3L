package com.example.gofit.data.remote.response

import com.google.gson.annotations.SerializedName

data class LoginResponse(

	@field:SerializedName("access_token")
	val accessToken: String,

	@field:SerializedName("message")
	val message: String,

	@field:SerializedName("token_type")
	val tokenType: String,

	@field:SerializedName("user")
	val user: User
)

data class User(

	@field:SerializedName("depositKelas")
	val depositKelas: Int,

	@field:SerializedName("telp")
	val telp: String,

	@field:SerializedName("created_at")
	val createdAt: String,

	@field:SerializedName("tanggalLahir")
	val tanggalLahir: String,

	@field:SerializedName("statusMember")
	val statusMember: Int,

	@field:SerializedName("alamat")
	val alamat: String,

	@field:SerializedName("password")
	val password: String,

	@field:SerializedName("expired")
	val expired: String,

	@field:SerializedName("nama")
	val nama: String,

	@field:SerializedName("updated_at")
	val updatedAt: String,

	@field:SerializedName("deposit")
	val deposit: Int,

	@field:SerializedName("memberID")
	val memberID: Int,

	@field:SerializedName("username")
	val username: String
)
