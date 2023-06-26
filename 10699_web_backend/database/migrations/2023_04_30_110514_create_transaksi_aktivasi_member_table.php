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
        Schema::create('transaksi_aktivasi_member', function (Blueprint $table) {
            $table->integer('id_aktivasi', true);
            $table->timestamp('tgl_aktivasi')->nullable();
            $table->double('nominal_aktivasi');
            $table->integer('no_struk_transaksi')->index('no_struk_transaksi');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksi_aktivasi_member');
    }
};
