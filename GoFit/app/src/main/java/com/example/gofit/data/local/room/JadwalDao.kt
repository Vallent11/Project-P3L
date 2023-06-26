package com.example.gofit.data.local.room

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.example.gofit.data.local.entity.JadwalEntity

@Dao
interface JadwalDao {
    @Query ("SELECT * FROM jadwal ORDER BY jadwalID ASC")
    fun getJadwal() : LiveData<List<JadwalEntity>>

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    fun insertUsers(users: List<JadwalEntity>)

    @Update
    fun updateUsers(jadwals: JadwalEntity)

    @Query("DELETE FROM jadwal")
    fun deleteAll()
}