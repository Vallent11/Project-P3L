package com.example.gofit.data.local

import android.content.Context

internal class Preferences(context: Context?) {
    companion object{
        private const val TOKEN = "token"
        private const val ID = "id"
        private const val USERNAME = "username"
    }

    private val preferences = context?.getSharedPreferences(TOKEN, Context.MODE_PRIVATE)

    fun setToken(token : String) {
        val editor = preferences?.edit()
        editor?.putString(TOKEN, token)
        editor?.apply()
    }

    fun getToken(): String? {
        return preferences?.getString(TOKEN, "")
    }

    fun deleteAll () {
        val editor = preferences?.edit()
        editor?.clear()
        editor?.apply()
    }

    fun setId(id : Int) {
        val editor = preferences?.edit()
        editor?.putInt(ID, id)
        editor?.apply()
    }

    fun getId(): Int? {
        return preferences?.getInt(ID, 0)
    }

    fun setUsername(username : String) {
        val editor = preferences?.edit()
        editor?.putString(USERNAME, username)
        editor?.apply()
    }

    fun getUsername(): String? {
        return preferences?.getString(USERNAME, "")
    }
}