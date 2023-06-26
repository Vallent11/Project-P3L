package com.example.gofit.ui.activity.bookingkelas

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.gofit.BookingKelasData
import com.example.gofit.BookingKelasInfo
import com.example.gofit.data.local.Preferences
import com.example.gofit.databinding.ActivityBookingKelasBinding

class BookingKelasActivity : AppCompatActivity() {
    private lateinit var binding : ActivityBookingKelasBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBookingKelasBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val data = intent.getParcelableExtra<BookingKelasData>("DATA") as BookingKelasData
        val preferences = Preferences(this@BookingKelasActivity)
        binding.tanggalTV.text = data.tanggal
        binding.sesiTv.text = data.sesi
        binding.btnBookingKelas.setOnClickListener { bookingKelas(data,preferences) }
    }

    private fun bookingKelas(data: BookingKelasData, preferences: Preferences) {
        val mainViewModel =ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            BookingKelasViewModel::class.java)
        val dataSend = BookingKelasInfo(
            preferences.getId()!!,
            data.jadwalID,
            preferences.getUsername()!!,
            data.sesi,
            data.tanggal
        )
        mainViewModel.bookingKelas(dataSend)
        mainViewModel.message.observe(this, {
            it.getContentIfNotHandled()?.let {
                Toast.makeText(
                    this,
                    it,
                    Toast.LENGTH_SHORT
                ).show()
            }
        })
        mainViewModel.isLoading.observe(this@BookingKelasActivity, {
            showLoading(it)
        })
        finish()
    }

    private fun showLoading(it: Boolean) {
        if (it) {
            binding.progressBar.visibility = View.VISIBLE
        } else {
            binding.progressBar.visibility = View.GONE
        }
    }
}