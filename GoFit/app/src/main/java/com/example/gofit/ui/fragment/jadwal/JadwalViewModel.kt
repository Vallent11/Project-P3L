package com.example.gofit.ui.fragment.jadwal

import androidx.lifecycle.ViewModel
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.data.repository.JadwalRepository

class JadwalViewModel (private val jadwalRepository: JadwalRepository) : ViewModel() {
    fun getJadwal() = jadwalRepository.getJadwal()
}