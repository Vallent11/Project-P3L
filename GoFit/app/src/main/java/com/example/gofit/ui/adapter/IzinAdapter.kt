package com.example.gofit.ui.adapter

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.gofit.data.local.entity.IzinEntity
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.data.remote.response.DataItem
import com.example.gofit.databinding.ListIzinBinding

class IzinAdapter (private val listIzin : ArrayList<DataItem>) : ListAdapter<IzinEntity, IzinAdapter.ViewHolder>(
    IzinAdapter.DIFF_CALLBACK
){
    private lateinit var onItemClickCallback: OnItemClickCallback

    interface OnItemClickCallback {
        fun onItemClickClicked(data: DataItem)
    }

    fun setOnItemClickCallback(onItemClickCallback: OnItemClickCallback) {
        this.onItemClickCallback = onItemClickCallback
    }

    class ViewHolder(var binding: ListIzinBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(izin : IzinEntity) {
            binding.tanggalTV.text = izin.tanggal
            binding.sesiTv.text = izin.sesi
            binding.instrukturTv.text = izin.instruktur
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val binding = ListIzinBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return ViewHolder(binding)
    }

    companion object {
        val DIFF_CALLBACK: DiffUtil.ItemCallback<IzinEntity> =
            object : DiffUtil.ItemCallback<IzinEntity>() {
                override fun areItemsTheSame(oldUser: IzinEntity, newUser: IzinEntity): Boolean {
                    return oldUser.izinID == newUser.izinID
                }

                @SuppressLint("DiffUtilEquals")
                override fun areContentsTheSame(oldUser: IzinEntity, newUser: IzinEntity): Boolean {
                    return oldUser == newUser
                }
            }
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.binding.tanggalTV.text = listIzin[position].tanggalIzin
        holder.binding.sesiTv.text = listIzin[position].sesi
        holder.binding.instrukturTv.text = listIzin[position].instruktur
        holder.itemView.setOnClickListener {
            onItemClickCallback.onItemClickClicked(listIzin[holder.adapterPosition])
//            val intentToBooking = Intent(holder.itemView.context, BookingKelasActivity::class.java)
//            val data = BookingKelasData(
//                listJadwal[holder.adapterPosition].jadwalID,
//                listJadwal[holder.adapterPosition].sesi,
//                listJadwal[holder.adapterPosition].tanggal
//            )
//            intentToBooking.putExtra("DATA", data)
//            holder.itemView.context.startActivity(intentToBooking)
        }
    }

    override fun getItemCount(): Int {
        return listIzin.size
    }
}