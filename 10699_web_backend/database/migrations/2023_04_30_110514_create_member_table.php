<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('member', function (Blueprint $table) {
            $table->integer('id_member', true);
            $table->string('nama_member');
            $table->string('alamat_member');
            $table->timestamp('tgl_lahir_member')->useCurrentOnUpdate()->useCurrent();
            $table->double('deposit_uang_member');
            $table->double('deposit_paket_member');
            $table->integer('no_telp_member');
            $table->integer('id_pengguna')->index('id_pengguna');
            $table->timestamp('kadaluarsa_member')->nullable();
            $table->string('email');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('member');
    }
};
