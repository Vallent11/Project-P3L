package com.example.gofit.data.repository

import androidx.lifecycle.LiveData
import androidx.lifecycle.MediatorLiveData
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.data.local.room.JadwalDao
import com.example.gofit.data.remote.ApiService
import com.example.gofit.data.remote.response.JadwalResponse
import com.example.gofit.utils.AppExecutors
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response


class JadwalRepository private constructor(
    private val apiService : ApiService,
    private val jadwalDao : JadwalDao,
    private val appExecutors: AppExecutors
){
    private val result = MediatorLiveData<Result<List<JadwalEntity>>>()

    fun getJadwal() : LiveData<Result<List<JadwalEntity>>> {
        result.value = Result.Loading
        val client = apiService.getJadwal()
        client.enqueue(object : Callback<JadwalResponse> {
            override fun onResponse(
                call: Call<JadwalResponse>,
                response: Response<JadwalResponse>
            ) {
                if (response.isSuccessful) {
                    val allData = response.body()?.data
                    val listJadwal = ArrayList<JadwalEntity>()
                    appExecutors.diskIO.execute {
                        allData?.forEach { dataJadwal ->
                            val jadwal = JadwalEntity(
                                dataJadwal.jadwalID,
                                dataJadwal.tipe,
                                dataJadwal.sesi,
                                dataJadwal.tanggal,
                                dataJadwal.kapasitas,
                                dataJadwal.instruktur
                            )
                            listJadwal.add(jadwal)
                        }
                        jadwalDao.deleteAll()
                        jadwalDao.insertUsers(listJadwal)
                    }
                }
            }

            override fun onFailure(call: Call<JadwalResponse>, t: Throwable) {
                result.value = Result.Error(t.message.toString())
            }
        })

        val localData = jadwalDao.getJadwal()
        result.addSource(localData) { newData: List<JadwalEntity> ->
            result.value = Result.Success(newData)
        }
        return result
    }

    fun getJadwalInstruktur(username : String) : LiveData<Result<List<JadwalEntity>>> {
        result.value = Result.Loading
        val client = apiService.getJadwalInstruktur("batara")
        client.enqueue(object : Callback<JadwalResponse> {
            override fun onResponse(
                call: Call<JadwalResponse>,
                response: Response<JadwalResponse>
            ) {
                if (response.isSuccessful) {
                    val allData = response.body()?.data
                    val listJadwal = ArrayList<JadwalEntity>()
                    appExecutors.diskIO.execute {
                        allData?.forEach { dataJadwal ->
                            val jadwal = JadwalEntity(
                                dataJadwal.jadwalID,
                                dataJadwal.tipe,
                                dataJadwal.sesi,
                                dataJadwal.tanggal,
                                dataJadwal.kapasitas,
                                dataJadwal.instruktur
                            )
                            listJadwal.add(jadwal)
                        }
                        jadwalDao.deleteAll()
                        jadwalDao.insertUsers(listJadwal)
                    }
                }
            }

            override fun onFailure(call: Call<JadwalResponse>, t: Throwable) {
                result.value = Result.Error(t.message.toString())
            }
        })

        val localData = jadwalDao.getJadwal()
        result.addSource(localData) { newData: List<JadwalEntity> ->
            result.value = Result.Success(newData)
        }
        return result
    }

    companion object {
        @Volatile
        private var instance: JadwalRepository? = null
        fun getInstance(
            apiService: ApiService,
            jadwalDao: JadwalDao,
            appExecutors: AppExecutors
        ): JadwalRepository =
            instance ?: synchronized(this) {
                instance ?: JadwalRepository(apiService, jadwalDao, appExecutors)
            }.also { instance = it }

        private const val TAG = "JadwalRepository"
    }
}