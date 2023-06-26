<template>
  <div>
    <h1>Login</h1>
    <v-btn class="btn" @click="pindahHalaman">Login</v-btn>
  </div>
</template>
<script>
/*eslint-disable*/
import { defineComponent } from "vue";

export default defineComponent( {

  methods : {
    pindahHalaman()
    {
      this.$router.push({name:'login'})
    }
  }
})
</script>

<style scoped>
  .elevation-12 {
    border-radius: 8px;
    padding: 24px;
    margin-top: 64px;
  }
  
  .v-toolbar__title {
    font-size: 28px;
    font-weight: bold;
  }
  
  .v-text-field {
    margin-bottom: 16px;
  }
</style>

<!-- <style scoped>
  btn{
    margin-top:  1000px ;
  }
</style> -->
