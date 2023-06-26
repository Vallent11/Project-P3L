package com.example.gofit.ui.activity.izin

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.gofit.BookingKelasData
import com.example.gofit.PerizinanInfo
import com.example.gofit.data.local.Preferences
import com.example.gofit.databinding.ActivityIzinBinding

class IzinActivity : AppCompatActivity() {
    private lateinit var binding : ActivityIzinBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityIzinBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val data = intent.getParcelableExtra<BookingKelasData>("DATA") as BookingKelasData
        val preferences = Preferences(this@IzinActivity)
        binding.tanggalTV.text = data.tanggal
        binding.sesiTv.text = data.sesi
        setContentView(binding.root)
        binding.btnIzinKelas.setOnClickListener { izinKelas(data,preferences) }
    }

    private fun izinKelas(data: BookingKelasData, preferences: Preferences) {
        val mainViewModel = ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            IzinViewModel::class.java)
        val dataSend = PerizinanInfo(
            data.jadwalID,
            data.sesi,
            data.tanggal,
            preferences.getUsername().toString(),
            binding.instrukturPenggantiTv.text.toString()
        )
        mainViewModel.izinKelas(dataSend)
        mainViewModel.message.observe(this, {
            it.getContentIfNotHandled()?.let {
                Toast.makeText(
                    this,
                    it,
                    Toast.LENGTH_SHORT
                ).show()
            }
        })
        mainViewModel.isLoading.observe(this@IzinActivity, {
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