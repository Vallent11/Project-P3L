package com.example.gofit.ui.fragment.jadwalinstruktur

import androidx.lifecycle.ViewModel
import com.example.gofit.data.repository.JadwalRepository

class JadwalInstrukturViewModel (private val jadwalRepository: JadwalRepository): ViewModel() {
    fun getJadwalInstruktur(username : String) = jadwalRepository.getJadwalInstruktur(username)
}