package com.example.gofit.ui.adapter

import android.annotation.SuppressLint
import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.gofit.BookingKelasData
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.databinding.ListJadwalBinding
import com.example.gofit.ui.activity.bookingkelas.BookingKelasActivity

class JadwalAdapter (private val listJadwal : ArrayList<JadwalEntity>) : ListAdapter<JadwalEntity, JadwalAdapter.ViewHolder>(DIFF_CALLBACK) {
    private lateinit var onItemClickCallback: OnItemClickCallback

    interface OnItemClickCallback {
        fun onItemClickClicked(data: JadwalEntity)
    }

    fun setOnItemClickCallback(onItemClickCallback: OnItemClickCallback) {
        this.onItemClickCallback = onItemClickCallback
    }

    class ViewHolder(var binding: ListJadwalBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(jadwals : JadwalEntity) {
            binding.tanggalTV.text = jadwals.tanggal.toString()
            binding.sesiTv.text = jadwals.sesi
            binding.tipeTv.text = jadwals.tipe
            binding.instrukturTv.text = jadwals.instruktur
            binding.kapasitasTv.text = jadwals.kapasitas.toString()
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val binding =ListJadwalBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return ViewHolder(binding)
    }

    companion object {
        val DIFF_CALLBACK: DiffUtil.ItemCallback<JadwalEntity> =
            object : DiffUtil.ItemCallback<JadwalEntity>() {
                override fun areItemsTheSame(oldUser: JadwalEntity, newUser: JadwalEntity): Boolean {
                    return oldUser.jadwalID == newUser.jadwalID
                }

                @SuppressLint("DiffUtilEquals")
                override fun areContentsTheSame(oldUser: JadwalEntity, newUser: JadwalEntity): Boolean {
                    return oldUser == newUser
                }
            }
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.binding.tanggalTV.text = listJadwal[position].tanggal.toString()
        holder.binding.sesiTv.text = listJadwal[position].sesi
        holder.binding.tipeTv.text = listJadwal[position].tipe
        holder.binding.instrukturTv.text = listJadwal[position].instruktur
        holder.binding.kapasitasTv.text = listJadwal[position].kapasitas.toString()
        holder.itemView.setOnClickListener {
            onItemClickCallback.onItemClickClicked(listJadwal[holder.adapterPosition])
            val intentToBooking = Intent(holder.itemView.context, BookingKelasActivity::class.java)
            val data = BookingKelasData(
                listJadwal[holder.adapterPosition].jadwalID,
                listJadwal[holder.adapterPosition].sesi,
                listJadwal[holder.adapterPosition].tanggal
            )
            intentToBooking.putExtra("DATA", data)
            holder.itemView.context.startActivity(intentToBooking)
        }
    }

    override fun getItemCount(): Int {
        return listJadwal.size
    }
}