package com.example.gofit.ui.fragment.jadwal

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.gofit.data.local.entity.JadwalEntity
import com.example.gofit.data.repository.Result
import com.example.gofit.databinding.FragmentJadwalBinding
import com.example.gofit.ui.adapter.JadwalAdapter

class JadwalFragment : Fragment() {

    private var _binding : FragmentJadwalBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentJadwalBinding.inflate(inflater, container, false)

        val factory : JadwalViewModelFactory = JadwalViewModelFactory.getInstance(requireActivity())
        val viewModel : JadwalViewModel by viewModels {
            factory
        }
        showJadwalList(viewModel)
        return binding.root
    }

    private fun showJadwalList(viewModel: JadwalViewModel) {
        viewModel.getJadwal().observe(viewLifecycleOwner) { result ->
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
                        val jadwalAdapter = JadwalAdapter(listJadwal)
                        binding.jadwalRV.apply {
                            layoutManager = LinearLayoutManager(activity)
                            setHasFixedSize(true)
                            adapter = jadwalAdapter
                        }
                        jadwalAdapter.setOnItemClickCallback(object : JadwalAdapter.OnItemClickCallback {
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

    companion object{
        private const val TAG = "UsersFragment"
    }

}