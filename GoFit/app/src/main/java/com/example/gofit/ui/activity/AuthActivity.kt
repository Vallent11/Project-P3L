package com.example.gofit.ui.activity

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.gofit.R
import com.example.gofit.data.local.Preferences
import com.example.gofit.databinding.ActivityAuthBinding
import com.example.gofit.ui.fragment.login.LoginFragment

class AuthActivity : AppCompatActivity() {
    private lateinit var binding : ActivityAuthBinding

    companion object{
        private const val TAG = "AuthActivity"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAuthBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val mFragmentManager = supportFragmentManager
        val mLoginFragment = LoginFragment()
        val preferences = Preferences(this)
        val token = preferences.getToken()

        if (token.toString().isNotEmpty()) {
            mFragmentManager
                .beginTransaction()
                .add(R.id.frame_layout, mLoginFragment, LoginFragment::class.java.simpleName)
                .commit()
            preferences.deleteAll()
        } else {
            mFragmentManager
                .beginTransaction()
                .add(R.id.frame_layout, mLoginFragment, LoginFragment::class.java.simpleName)
                .commit()
        }
    }
}