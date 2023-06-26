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
        Schema::create('jadwal_kelas', function (Blueprint $table) {
            $table->integer('id_jadwal_kelas', true);
            $table->integer('jumlah_peserta');
            $table->integer('status');
            $table->integer('id_kelas')->index('id_kelas');
            $table->integer('id_jadwal_harian')->index('id_jadwal_harian');
            $table->integer('id_presensi_instruktur')->index('id_presensi_instruktur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jadwal_kelas');
    }
};
