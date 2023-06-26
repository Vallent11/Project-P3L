package com.example.gofit.ui.activity.bookingkelas

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.gofit.BookingKelasInfo
import com.example.gofit.Event
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.remote.response.BookingKelasResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class BookingKelasViewModel : ViewModel() {
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    private val _bookingKelasResponse = MutableLiveData<BookingKelasResponse>()
    val bookingKelas: LiveData<BookingKelasResponse> = _bookingKelasResponse

    private val _statusMessage = MutableLiveData<Event<String>>()
    val message : LiveData<Event<String>> = _statusMessage

    fun bookingKelas(kelasInfo : BookingKelasInfo) {
        _isLoading.value = true
        val client = ApiConfig.getApiService().bookingKelas(kelasInfo)
        client.enqueue(object : Callback<BookingKelasResponse> {
            override fun onResponse(
                call: Call<BookingKelasResponse>,
                response: Response<BookingKelasResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _statusMessage.value = Event(response.body()?.message.toString())
                } else {
                    _statusMessage.value = Event(response.message())
                    Log.e(TAG, "onFailure: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<BookingKelasResponse>, t: Throwable) {
                _isLoading.value = false
                _statusMessage.value = Event(t.message.toString())
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }

        })
    }

    companion object {
        private const val TAG = "BookingKelasViewModel"
    }
}