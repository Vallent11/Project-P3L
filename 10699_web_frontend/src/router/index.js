/* eslint-disable */
import Vue from 'vue'
import VueRouter from 'vue-router'
import LoginView from '../views/LoginView.vue'
import MOView from '../views/MOView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('../views/AboutView.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/LoginView.vue'),
  },
  {
    path: '/kasir',
    name: 'kasir',
    component: () => import('../views/KasirView.vue'),
    children: [
      {
        path: '/dashboard',
        name: 'dashboard',
        title: 'Go Fit | Dashboard',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/Perizinan.vue')
      },
      {
        path: '/transaksiaktivasi',
        name: 'transaksiaktivasi',
        component: () => import('../views/AktivasiHalamanView.vue')
      },
      {
        path: '/depositUang',
        name: 'depositUang',
        title: 'Go Fit | DepositUang',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/DepositUangView.vue')
      },
      {
        path: '/depositKelas',
        name: 'depositKelas',
        title: 'Go Fit | DepositKelas',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/DepositPaketView.vue')
      },
      {
        path: '/presensiGym',
        name: 'presensiGym',
        title: 'Go Fit | PresensiGym',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/PresensiGym.vue')
      },
      {
        path: '/presensiKelas',
        name: 'presensiKelas',
        title: 'Go Fit | PresensiKelas',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/PresensiKelas.vue')
      },
      {
        path: '/member',
        name: 'member',
        title: 'Go Fit | Member',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/MemberView.vue')
      },
      
    ]
  },
  
  {
    path: '/admin',
    name: 'admin',
    component: () => import('../views/AdminView.vue'),
    children: [
      {
        path: '/dashboard',
        name: 'dashboard',
        title: 'Go Fit | Dashboard',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/Perizinan.vue')
      },
      {
        path: '/instruktur',
        name: 'instruktur',
        title: 'Go Fit | Instruktur',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/InstrukturView.vue')
      }
    ]
  },
  {
    path: '/mo',
    name: 'mo',
    component: () => import('../views/MOView.vue'),
    children: [
      {
        path: '/dashboard',
        name: 'dashboard',
        title: 'Go Fit | Dashboard',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/Perizinan.vue')
      },
      {
        path: '/jadwalumum',
        name: 'jadwalumum',
        title: 'Go Fit | Jadwal Umum',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/JadwalUmumView.vue')
      },
      {
        path: '/laporantahun',
        name: 'laporantahun',
        title: 'Go Fit | Laporan Tahunan',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/LaporanTahunView.vue')
      },
      {
        path: '/laporankelas',
        name: 'laporankelas',
        title: 'Go Fit | Laporan Kelas',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/LaporanKelasView.vue')
      },
      {
        path: '/laporangym',
        name: 'laporangym',
        title: 'Go Fit | Laporan Gym',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/LaporanGymView.vue')
      },
      {
        path: '/laporaninstruktur',
        name: 'laporaninstruktur',
        title: 'Go Fit | Laporan Instruktur',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/LaporanInstrukturView.vue')
      }
    ]
  },

  { 
    path: '/jadwalharian',
    name: 'jadwalharian',
    component: () => import('../views/DataJadwalharianView.vue')
  },

  { 
    path: '/izin',
    name: 'izin',
    component: () => import('../views/izinView.vue')
  },

  {
    path: '/transaksihalaman',
    name: 'transaksi',
    component: () => import('../views/TransaksiHalamanView.vue')
  },
  {
    path: '/deposit',
    name: 'deposit',
    component: () => import('../views/DepositPaketView.vue')
  },
  {
    path: '/uang',
    name: 'uang',
    component: () => import('../views/DepositUangView.vue')
  },
]

const router = new VueRouter({
  routes
})

export default router
