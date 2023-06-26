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
        Schema::table('presensi_instruktur', function (Blueprint $table) {
            $table->foreign(['id_kelas'], 'presensi_instruktur_ibfk_2')->references(['id_kelas'])->on('kelas');
            $table->foreign(['id_instruktur'], 'presensi_instruktur_ibfk_1')->references(['id_instruktur'])->on('instruktur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('presensi_instruktur', function (Blueprint $table) {
            $table->dropForeign('presensi_instruktur_ibfk_2');
            $table->dropForeign('presensi_instruktur_ibfk_1');
        });
    }
};
