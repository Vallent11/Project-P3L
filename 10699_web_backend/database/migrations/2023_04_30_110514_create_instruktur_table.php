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
        Schema::create('instruktur', function (Blueprint $table) {
            $table->integer('id_instruktur', true);
            $table->string('nama_instruktur');
            $table->timestamp('tgl_lahir_instruktur')->useCurrentOnUpdate()->useCurrent();
            $table->string('alamat_instruktur');
            $table->integer('no_telp_instruktur');
            $table->integer('id_pengguna')->index('id_pengguna');
            $table->integer('id_jadwal_umum');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('instruktur');
    }
};
