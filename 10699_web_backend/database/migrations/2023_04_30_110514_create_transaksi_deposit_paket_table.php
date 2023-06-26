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
        Schema::create('transaksi_deposit_paket', function (Blueprint $table) {
            $table->integer('no_struk_deposit_kelas_paket', true);
            $table->double('nominal_deposit_kelas_paket');
            $table->double('nominal_total_deposit_kelas_paket');
            $table->timestamp('tgl_deposit_kelas_paket')->useCurrentOnUpdate()->useCurrent();
            $table->integer('id_promo')->index('id_promo');
            $table->integer('no_struk_transaksi')->index('no_struk_transaksi');
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
        Schema::dropIfExists('transaksi_deposit_paket');
    }
};
