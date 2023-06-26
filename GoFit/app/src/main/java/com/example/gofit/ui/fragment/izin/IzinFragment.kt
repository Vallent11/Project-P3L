package com.example.gofit.ui.fragment.izin

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.gofit.R
import com.example.gofit.data.local.Preferences
import com.example.gofit.data.remote.response.DataItem
import com.example.gofit.data.remote.response.IzinResponse
import com.example.gofit.databinding.FragmentIzinBinding
import com.example.gofit.databinding.FragmentJadwalBinding
import com.example.gofit.ui.adapter.IzinAdapter

class IzinFragment : Fragment() {

    private var _binding : FragmentIzinBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentIzinBinding.inflate(inflater, container, false)

        val mainViewModel = ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            IzinViewModel::class.java)

        val preferences = Preferences(requireContext())
        val username = preferences.getUsername()
        if (username != null) {
            mainViewModel.getIzin("batara")
        }
        mainViewModel.izin.observe(this, { data ->
            if (data != null) {
                setAdapterData(data.data)
            }
        })

        mainViewModel.isLoading.observe(this, {
            showLoading(it)
        })

        mainViewModel.message.observe(this, {
            it.getContentIfNotHandled()?.let {
                Toast.makeText(
                    requireContext(),
                    it,
                    Toast.LENGTH_SHORT
                ).show()
            }
        })
        val layoutManager = LinearLayoutManager(activity)
        binding.izinRv.layoutManager = layoutManager
        return binding.root
    }

    private fun setAdapterData(data: List<DataItem>) {
        val listIzin = ArrayList<DataItem>()
        for (izin in data) {
            listIzin.add(izin)
        }
        val adapter = IzinAdapter(listIzin)
        binding.izinRv.setHasFixedSize(true)
        binding.izinRv.adapter = adapter
        adapter.setOnItemClickCallback(object : IzinAdapter.OnItemClickCallback {
            override fun onItemClickClicked(data: DataItem) {

            }

        })
    }

    private fun showLoading(isLoading: Boolean) {
        if (isLoading) {
            binding.progressBar.visibility = View.VISIBLE
        } else {
            binding.progressBar.visibility = View.GONE
        }
    }

}