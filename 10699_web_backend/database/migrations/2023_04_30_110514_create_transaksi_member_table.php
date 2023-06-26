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
        Schema::create('transaksi_member', function (Blueprint $table) {
            $table->integer('no_struk_transaksi', true);
            $table->integer('id_pegawai')->index('id_pegawai');
            $table->string('jenis_transaksi');
            $table->integer('id_member')->index('id_member');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksi_member');
    }
};
