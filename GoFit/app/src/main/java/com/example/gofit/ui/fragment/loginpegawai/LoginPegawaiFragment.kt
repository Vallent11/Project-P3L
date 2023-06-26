package com.example.gofit.ui.fragment.loginpegawai

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
import com.example.gofit.data.remote.response.LoginInstrukturResponse
import com.example.gofit.databinding.FragmentLoginPegawaiBinding
import com.example.gofit.ui.activity.HomePegawaiActivity
import com.example.gofit.ui.fragment.login.LoginFragment

class LoginPegawaiFragment : Fragment() {

    private var _binding : FragmentLoginPegawaiBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentLoginPegawaiBinding.inflate(inflater, container, false)
        val mainViewModel = ViewModelProvider(this, ViewModelProvider.NewInstanceFactory()).get(
            LoginPegawaiViewModel::class.java)

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
        binding.memberTv.setOnClickListener {
            val registerFragment = LoginFragment()
            requireActivity().supportFragmentManager
                .beginTransaction()
                .replace(R.id.frame_layout, registerFragment, LoginFragment::class.java.simpleName)
                .commit()
        }

        return binding.root
    }

    private fun showMessage(data: LoginInstrukturResponse?) {
        if (data?.accessToken.toString().isNotEmpty()) {
            val preferences = Preferences(requireActivity())
            preferences.setToken(data?.accessToken.toString())
            preferences.setUsername(data?.user?.username.toString())
            data?.user?.pegawaiID?.let { preferences.setId(it) }
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
        val intent = Intent(this@LoginPegawaiFragment.requireActivity(), HomePegawaiActivity::class.java)
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