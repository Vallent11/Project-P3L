<template>
    <div class="background">
      <div>
        <td>
            <v-btn class="btn" @click="backhalaman">Kembali</v-btn>
        </td>
            <v-btn class="btn" @click="aktivasihalaman">Transaksi Aktivasi</v-btn>
            <v-btn class="btn" @click="deposithalaman">Transaksi Paket</v-btn>
            <v-btn class="btn" @click="uanghalaman">Transaksi Uang</v-btn>
      </div>
    </div>
  </template>

<script>
/*eslint-disable*/
    import { defineComponent, } from "vue";
    

    export default defineComponent( {
    
      methods : {
        backhalaman()
        {
          this.$router.push({name:'kasir'})
        },
        aktivasihalaman()
        {
          this.$router.push({name:'transaksiaktivasi'})
        },  
        deposithalaman()
        {
          this.$router.push({name:'deposit'})
        },
        uanghalaman()
        {
          this.$router.push({name:'uang'})
        },
      }
    })
    </script>
    
    <style scoped>
      .background{
        background-size: cover;
        background-position: cover;
        height: 100%;
        width: 100%;
        backdrop-filter: blur(10px);
      }
  
      .btn{
        margin-top:  100px ;
        margin: 10px;
      }
  
      .white-text {
      color: white;
      }
    </style>
    