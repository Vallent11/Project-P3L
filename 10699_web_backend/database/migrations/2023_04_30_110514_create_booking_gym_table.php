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
        Schema::create('booking_gym', function (Blueprint $table) {
            $table->integer('no_booking_gym', true);
            $table->timestamp('tgl_booking_gym')->useCurrentOnUpdate()->useCurrent();
            $table->string('kehadiran_gym');
            $table->tinyInteger('is_canceled');
            $table->integer('id_sesi_gym')->index('id_sesi_gym');
            $table->integer('id_member')->index('id_member');
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
        Schema::dropIfExists('booking_gym');
    }
};
