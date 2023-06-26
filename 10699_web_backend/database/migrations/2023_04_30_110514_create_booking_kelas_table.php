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
        Schema::create('booking_kelas', function (Blueprint $table) {
            $table->integer('no_booking_kelas', true);
            $table->timestamp('tgl_booking_kelas')->useCurrentOnUpdate()->useCurrent();
            $table->string('kehadiran_kelas');
            $table->tinyInteger('is_canceled');
            $table->integer('no_struk_transaksi')->index('no_struk_transaksi');
            $table->integer('id_member')->index('id_member');
            $table->integer('id_jadwal_kelas')->index('id_jadwal_kelas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('booking_kelas');
    }
};
