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
        Schema::table('jadwal_kelas', function (Blueprint $table) {
            $table->foreign(['id_kelas'], 'jadwal_kelas_ibfk_2')->references(['id_kelas'])->on('kelas');
            $table->foreign(['id_presensi_instruktur'], 'jadwal_kelas_ibfk_1')->references(['id_presensi_instruktur'])->on('presensi_instruktur');
            $table->foreign(['id_jadwal_harian'], 'jadwal_kelas_ibfk_3')->references(['id_jadwal_harian'])->on('jadwal_harian');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('jadwal_kelas', function (Blueprint $table) {
            $table->dropForeign('jadwal_kelas_ibfk_2');
            $table->dropForeign('jadwal_kelas_ibfk_1');
            $table->dropForeign('jadwal_kelas_ibfk_3');
        });
    }
};
