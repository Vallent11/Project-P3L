package com.example.gofit.ui.fragment.login

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.gofit.R
import com.example.gofit.data.local.Preferences
import com.example.gofit.data.remote.response.LoginResponse
import com.example.gofit.databinding.FragmentLoginBinding
import com.example.gofit.ui.activity.HomeActivity
import com.example.gofit.ui.fragment.jadwal.JadwalFragment
import com.example.gofit.ui.fragment.loginpegawai.LoginPegawaiFragment


class LoginFragment : Fragment() {

    private var _binding : FragmentLoginBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentLoginBinding.inflate(inflater, container, false)
        val mainViewModel = ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            LoginViewModel::class.java)

        binding.btnLogin.setOnClickListener {
            mainViewModel.login(binding.edLoginEmail.text.toString(),
                binding.edLoginPassword.text.toString())
            mainViewModel.login.observe(viewLifecycleOwner, {data ->
                showMessage(data)
            })
            mainViewModel.isLoading.observe(viewLifecycleOwner, {
                showLoading(it)
            })
            mainViewModel.message.observe(viewLifecycleOwner, {
                it.getContentIfNotHandled()?.let {
                    Toast.makeText(
                        activity,
                        it,
                        Toast.LENGTH_SHORT
                    ).show()
                }
            })
        }

        binding.instrukturTv.setOnClickListener {
            val registerFragment = LoginPegawaiFragment()
            requireActivity().supportFragmentManager
                .beginTransaction()
                .replace(R.id.frame_layout, registerFragment, LoginPegawaiFragment::class.java.simpleName)
                .commit()
        }
        return binding.root
    }

    private fun showMessage(data: LoginResponse?) {
        if (data?.accessToken.toString().isNotEmpty()) {
            val preferences = Preferences(requireActivity())
            preferences.setToken(data?.accessToken.toString())
            preferences.setUsername(data?.user?.username.toString())
            data?.user?.memberID?.let { preferences.setId(it) }
            moveToJadwal()
        } else {
            Toast.makeText(
                requireActivity(),
                data?.message,
                Toast.LENGTH_SHORT
            ).show()
        }

    }

    private fun moveToJadwal() {

        val intent = Intent(this@LoginFragment.requireActivity(), HomeActivity::class.java)
        startActivity(intent)
    }

    private fun showLoading(isLoading: Boolean) {
        if (isLoading) {
            binding.progressBar.visibility = View.VISIBLE
        } else {
            binding.progressBar.visibility = View.GONE
        }
    }
}