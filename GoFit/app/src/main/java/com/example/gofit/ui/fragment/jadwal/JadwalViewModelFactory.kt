package com.example.gofit.ui.fragment.jadwal

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.gofit.data.repository.JadwalRepository
import com.example.gofit.di.Injection
import com.example.gofit.ui.fragment.jadwalinstruktur.JadwalInstrukturViewModel

class JadwalViewModelFactory private constructor(private val jadwalRepository: JadwalRepository) : ViewModelProvider.NewInstanceFactory(){
    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(JadwalViewModel::class.java)) {
            return JadwalViewModel(jadwalRepository) as T
        } else if (modelClass.isAssignableFrom(JadwalInstrukturViewModel::class.java)){
            return JadwalInstrukturViewModel(jadwalRepository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class " +modelClass.name)
    }

    companion object{
        @Volatile
        private var instance : JadwalViewModelFactory? = null
        fun getInstance(context: Context) : JadwalViewModelFactory =
            instance ?: synchronized(this) {
                instance ?: JadwalViewModelFactory(Injection.provideRepository(context))
            }.also { instance = it }
    }
}