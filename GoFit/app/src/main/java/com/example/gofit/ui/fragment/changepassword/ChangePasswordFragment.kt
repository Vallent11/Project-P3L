package com.example.gofit.ui.fragment.changepassword

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.gofit.data.local.Preferences
import com.example.gofit.databinding.FragmentChangePasswordBinding

class ChangePasswordFragment : Fragment() {

    private var _binding : FragmentChangePasswordBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentChangePasswordBinding.inflate(inflater, container,false)
        val mainViewModel = ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            ChangePasswordViewModel::class.java)
        binding.btnLogin.setOnClickListener {
            val preferences = Preferences(requireContext())
            val id = preferences.getId()
            if (id != null) {
                mainViewModel.changePassword(id, binding.edLoginPassword.text.toString())
                mainViewModel.message.observe(this, {
                    it.getContentIfNotHandled()?.let {
                        Toast.makeText(
                            requireContext(),
                            it,
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                })
                mainViewModel.isLoading.observe(viewLifecycleOwner, {
                    showLoading(it)
                })
            }
        }
        return binding.root
    }

    private fun showLoading(it: Boolean) {
        if (it) {
            binding.progressBar.visibility = View.VISIBLE
        } else {
            binding.progressBar.visibility = View.GONE
        }
    }
}