package com.example.gofit.ui.activity.izin

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.gofit.Event
import com.example.gofit.PerizinanInfo
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.remote.response.AddIzinResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class IzinViewModel : ViewModel(){
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    private val _izinResponse = MutableLiveData<AddIzinResponse>()
    val izinResponse: LiveData<AddIzinResponse> = _izinResponse

    private val _statusMessage = MutableLiveData<Event<String>>()
    val message : LiveData<Event<String>> = _statusMessage

    fun izinKelas(izin : PerizinanInfo){
        _isLoading.value = true
        val client = ApiConfig.getApiService().addIzin(izin)
        client.enqueue(object : Callback<AddIzinResponse> {
            override fun onResponse(
                call: Call<AddIzinResponse>,
                response: Response<AddIzinResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _statusMessage.value = Event(response.body()?.message.toString())
                } else {
                    _statusMessage.value = Event(response.message())
                    Log.e(TAG, "onFailure: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<AddIzinResponse>, t: Throwable) {
                _isLoading.value = false
                _statusMessage.value = Event(t.message.toString())
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }

        })
    }

    companion object {
        private const val TAG = "IzinViewModel"
    }
}