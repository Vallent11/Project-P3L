package com.example.gofit.ui.fragment.jadwalinstruktur

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.gofit.data.local.Preferences
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.data.repository.Result
import com.example.gofit.databinding.FragmentJadwalInstrukturBinding
import com.example.gofit.ui.adapter.JadwalIzinAdapter
import com.example.gofit.ui.fragment.jadwal.JadwalViewModelFactory

class JadwalInstrukturFragment : Fragment() {

    private var _binding : FragmentJadwalInstrukturBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentJadwalInstrukturBinding.inflate(inflater, container, false)

        val factory : JadwalViewModelFactory = JadwalViewModelFactory.getInstance(requireActivity())
        val viewModel : JadwalInstrukturViewModel by viewModels {
            factory
        }
        val preferences = Preferences(context)
        val username = preferences.getUsername()
        if (username != null) {
            showJadwalList(viewModel, username)
        }
        return binding.root
    }

    private fun showJadwalList(viewModel: JadwalInstrukturViewModel, username: String) {
        viewModel.getJadwalInstruktur(username).observe(viewLifecycleOwner) { result ->
            if (result != null) {
                when (result) {
                    is Result.Loading -> {
                        binding.progressBar?.visibility = View.VISIBLE
                    }
                    is Result.Success -> {
                        binding.progressBar?.visibility = View.GONE
                        val listJadwal = ArrayList<JadwalEntity>()
                        for (jadwal in result.data.toList()){
                            listJadwal.add(jadwal)
                        }
                        val jadwalAdapter = JadwalIzinAdapter(listJadwal)
                        binding.jadwalRV.apply {
                            layoutManager = LinearLayoutManager(activity)
                            setHasFixedSize(true)
                            adapter = jadwalAdapter
                        }
                        jadwalAdapter.setOnItemClickCallback(object : JadwalIzinAdapter.OnItemClickCallback {
                            override fun onItemClickClicked(data: JadwalEntity) {

                            }
                        })
                    }
                    is Result.Error -> {
                        binding.progressBar?.visibility = View.GONE
                        Toast.makeText(
                            context,
                            "Terjadi kesalahan " + result.error,
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                }
            }
        }
    }

}