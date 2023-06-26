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
        Schema::create('sesi_gym', function (Blueprint $table) {
            $table->integer('id_sesi_gym', true);
            $table->date('tgl_sesi_gym');
            $table->time('waktu_mulai');
            $table->time('waktu_selesai');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sesi_gym');
    }
};
