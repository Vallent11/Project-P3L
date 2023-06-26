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
        Schema::create('izin_instruktur', function (Blueprint $table) {
            $table->integer('id_izin_instruktur', true);
            $table->string('status_izin_instruktur');
            $table->timestamp('tgl_pengajuan_izin_instruktur')->useCurrentOnUpdate()->useCurrent();
            $table->integer('id_jadwal_kelas')->index('id_jadwal_kelas');
            $table->integer('id_instruktur')->index('id_instruktur');
            $table->integer('id_instruktur_pengganti')->index('id_instruktur_pengganti');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('izin_instruktur');
    }
};
