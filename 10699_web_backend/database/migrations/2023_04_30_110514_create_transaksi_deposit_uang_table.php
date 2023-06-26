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
        Schema::create('transaksi_deposit_uang', function (Blueprint $table) {
            $table->integer('no_struk_deposit_uang', true);
            $table->timestamp('tgl_deposit_uang')->useCurrentOnUpdate()->useCurrent();
            $table->integer('id_promo')->index('id_promo');
            $table->integer('no_struk_transaksi')->index('no_struk_transaksi');
            $table->double('nominal_deposit_uang');
            $table->double('nominal_total_deposit');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksi_deposit_uang');
    }
};
