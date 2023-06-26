package com.example.gofit.ui.fragment.changepassword

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.gofit.BookingKelasInfo
import com.example.gofit.Event
import com.example.gofit.PasswordInfo
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.remote.response.BookingKelasResponse
import com.example.gofit.data.remote.response.ChangePasswordResponse
import com.example.gofit.ui.activity.bookingkelas.BookingKelasViewModel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class ChangePasswordViewModel : ViewModel() {
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    private val _changePassword = MutableLiveData<ChangePasswordResponse>()
    val changePassword: LiveData<ChangePasswordResponse> = _changePassword

    private val _statusMessage = MutableLiveData<Event<String>>()
    val message : LiveData<Event<String>> = _statusMessage

    fun changePassword(id : Int, newPassword : String) {
        _isLoading.value = true
        val data = PasswordInfo(
            newPassword
        )
        val client = ApiConfig.getApiService().changePassword(id, data)
        client.enqueue(object : Callback<ChangePasswordResponse> {
            override fun onResponse(
                call: Call<ChangePasswordResponse>,
                response: Response<ChangePasswordResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _statusMessage.value = Event(response.body()?.message.toString())
                } else {
                    _statusMessage.value = Event(response.message())
                    Log.e(TAG, "onFailure: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<ChangePasswordResponse>, t: Throwable) {
                _isLoading.value = false
                _statusMessage.value = Event(t.message.toString())
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }

        })
    }

    companion object {
        private const val TAG = "ChangePassword"
    }
}