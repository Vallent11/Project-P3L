package com.example.gofit.data.local.room

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.gofit.data.local.entity.JadwalEntity

@Database(entities = [JadwalEntity::class], version = 1, exportSchema = false)
abstract class JadwalDatabase : RoomDatabase() {
    abstract fun jadwalDao() : JadwalDao

    companion object{
        @Volatile
        private var instance: JadwalDatabase? = null
        fun getInstance(context: Context): JadwalDatabase =
            instance ?: synchronized(this) {
                instance ?: Room.databaseBuilder(
                    context.applicationContext,
                    JadwalDatabase::class.java, "Jadwal.db"
                )
                    .allowMainThreadQueries()
                    .build()
            }
    }
}