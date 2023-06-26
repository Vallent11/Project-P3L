import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import vuetify from './plugins/vuetify'
import '@mdi/font/css/materialdesignicons.css'
// import Chart from 'chart.js'
import Chart from 'chart.js/auto';
import Particles from "particles.js";

// import Chartkick from 'vue-chartkick
Vue.config.productionTip = false

new Vue({
  router,
  vuetify,
  Chart,
  Particles,
  // Chartkick,
  render: h => h(App)
}).$mount('#app')
