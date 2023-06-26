package com.example.gofit.ui.fragment.loginpegawai

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.gofit.Event
import com.example.gofit.LoginInstrukturInfo
import com.example.gofit.LoginUserInfo
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.remote.response.LoginInstrukturResponse
import com.example.gofit.data.remote.response.LoginResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LoginPegawaiViewModel : ViewModel(){
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    private val _loginResponse = MutableLiveData<LoginInstrukturResponse>()
    val login: LiveData<LoginInstrukturResponse> = _loginResponse

    private val _statusMessage = MutableLiveData<Event<String>>()
    val message : LiveData<Event<String>> = _statusMessage

    fun login(username: String, password: String) {
        _isLoading.value = true
        val loginInfo = LoginInstrukturInfo(username, password)
        val client = ApiConfig.getApiService().loginPegawai(loginInfo)
        client.enqueue(object : Callback<LoginInstrukturResponse> {
            override fun onResponse(
                call: Call<LoginInstrukturResponse>,
                response: Response<LoginInstrukturResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _statusMessage.value = Event(response.body()?.message.toString())
                    _loginResponse.value = response.body()
                } else {
                    _statusMessage.value = Event(response.message())
                    Log.e(TAG, "onFailure: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<LoginInstrukturResponse>, t: Throwable) {
                _isLoading.value = false
                _statusMessage.value = Event(t.message.toString())
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }

        })
    }

    companion object {
        private const val TAG = "LoginViewModel"
    }
}