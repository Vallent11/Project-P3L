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
        Schema::create('pegawai', function (Blueprint $table) {
            $table->integer('id_pegawai', true);
            $table->string('nama_pegawai');
            $table->string('alamat_pegawai');
            $table->timestamp('tgl_lahir_pegawai')->useCurrentOnUpdate()->useCurrent();
            $table->integer('no_telp_pegawai');
            $table->integer('id_pengguna')->index('id_pengguna');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pegawai');
    }
};
