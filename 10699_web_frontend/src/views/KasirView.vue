<template>
  <v-card class="mx-auto overflow-hidden fullheight">
    <v-app-bar color="dark-blue" dark>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
    </v-app-bar>

    <div style="padding: 30px; margin-bottom: 62px">
      <router-view></router-view>
    </div>

    <v-navigation-drawer v-model="drawer" class="fullheight" width="256" app>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6 black--text">
            <strong>Go-Fit ~ Kasir</strong>
          </v-list-item-title>
          <v-list-item-subtitle class="black--text"> </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-list nav dense>
        <v-list-item-group
        v-for="item in items"
            :key="item.title"
            v-model="item.active"
            active-class="deep-purple--text text--accent-4"
        >
          <v-list-item
            :to="item.to"
            link
          >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
        <v-list-item v-for="child in item.child" :key="child.title">
          <v-list-item-title :to="child.route">{{ child.title }}</v-list-item-title>
        </v-list-item>
        </v-list-item-group>
      </v-list>
      <v-btn style="margin-top: 420px; margin-left: 40px" text
        @click="dialog = true"
        >Log Out</v-btn>
    </v-navigation-drawer>

    <v-dialog v-model="dialog" max-width="500px">
      <v-card>
        <v-card-title class="text-h5"
          >Are you sure you want to logout?</v-card-title
        >
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="dialog = false"
            >Cancel</v-btn
          >
          <v-btn color="blue darken-1" text @click="logout()">OK</v-btn>
          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    drawer: true,
    group: null,
    dialog: false,
    items: [
      { title: "Dashboard", icon: "mdi-view-dashboard", to: "dashboard" },
      // { title: "Transaksi", icon: "mdi-wallet", to: "transaksiaktivasi" },
      { title: "Aktivasi", icon: "mdi-wallet-membership", to: "transaksiaktivasi" },
      { title: "Deposit Uang", icon: "mdi-cash-multiple", to: "DepositUang"},
      { title: "Deposit Kelas", icon: "mdi-calendar-today", to: "DepositKelas"},
      { title: "Presensi Gym", icon: "mdi-bone", to: "PresensiGym"},
      { title: "Presensi Kelas", icon: "mdi-book", to: "PresensiKelas"},
      // { title: "Booking", icon: "mdi-bookmark", to: "booking" },
      { title: "Member", icon: "mdi-account-group", to: "member" },
      // { title: "Instruktur", icon: "mdi-account-group", to: "instruktur" },
    ],
  }),

  methods: {
    logout() {
      this.snackbar = true;
      this.$router.push({
        path: "/login",
      });
    },
  },
};
</script>

<!-- <template>
  <div class="background">
    <div>
      <h2 class="black-text">Selamat datang (KASIR)</h2>
      <v-btn class="btn" @click="pindahHalaman">Mengelola Member</v-btn>
      <v-btn class="btn" @click="transaksihalaman">Transaksi</v-btn>
      <v-btn class="btn" @click="keluarhalaman">Log out</v-btn>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
  import { defineComponent } from "vue";
  
  export default defineComponent( {
  
    methods : {
      pindahHalaman()
      {
        this.$router.push({name:'member'})
      },
      keluarhalaman()
      {
        localStorage.setItem('login',false)
        this.$router.push({name:'login'})
      },
      transaksihalaman()
      {
        this.$router.push({name:'transaksi'})
      }
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
   -->