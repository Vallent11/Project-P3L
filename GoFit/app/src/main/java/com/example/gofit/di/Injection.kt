package com.example.gofit.di

import android.content.Context
import com.example.gofit.data.local.room.JadwalDatabase
import com.example.gofit.data.remote.ApiConfig
import com.example.gofit.data.repository.JadwalRepository
import com.example.gofit.utils.AppExecutors

object Injection {
    fun provideRepository(context: Context) : JadwalRepository {
        val apiService = ApiConfig.getApiService()
        val database = JadwalDatabase.getInstance(context)
        val dao = database.jadwalDao()
        val appExecutors = AppExecutors()
        return JadwalRepository.getInstance(apiService, dao, appExecutors)
    }
}