package com.example.gofit.ui.fragment.izin

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.gofit.Event
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.remote.response.IzinResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class IzinViewModel : ViewModel() {
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    private val _izinResponse = MutableLiveData<IzinResponse>()
    val izin: LiveData<IzinResponse> = _izinResponse

    private val _statusMessage = MutableLiveData<Event<String>>()
    val message : LiveData<Event<String>> = _statusMessage

    fun getIzin(username: String) {
        _isLoading.value = true
        val client = ApiConfig.getApiService().getIzinInstruktur(username)
        client.enqueue(object : Callback<IzinResponse> {
            override fun onResponse(
                call: Call<IzinResponse>,
                response: Response<IzinResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _statusMessage.value = Event(response.body()?.message.toString())
                    _izinResponse.value = response.body()
                } else {
                    _statusMessage.value = Event(response.message())
                    Log.e(TAG, "onFailure: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<IzinResponse>, t: Throwable) {
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