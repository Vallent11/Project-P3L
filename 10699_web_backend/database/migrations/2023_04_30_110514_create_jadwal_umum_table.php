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
        Schema::create('jadwal_umum', function (Blueprint $table) {
            $table->integer('id_jadwal_umum', true);
            $table->string('hari_jadwal');
            $table->time('jam_mulai');
            $table->time('jam_selesai');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jadwal_umum');
    }
};
