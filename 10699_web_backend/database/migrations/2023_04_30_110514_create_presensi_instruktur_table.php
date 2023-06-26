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
        Schema::create('presensi_instruktur', function (Blueprint $table) {
            $table->integer('id_presensi_instruktur', true);
            $table->string('status_instruktur');
            $table->timestamp('waktu_presensi_instruktur')->useCurrentOnUpdate()->useCurrent();
            $table->integer('id_instruktur')->index('id_instruktur');
            $table->integer('id_kelas')->index('id_kelas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('presensi_instruktur');
    }
};
