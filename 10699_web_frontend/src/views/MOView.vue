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
            <strong>Go-Fit ~ MO</strong>
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
      { title: "Jadwal Umum", icon: "mdi-calendar", to: "jadwalumum" },
      { title: "Laporan(Tahun Tertentu)", icon: "mdi-chart-bar", to: "LaporanTahun"},
      { title: "Laporan Kelas", icon: "mdi-file-document", to: "LaporanKelas"},
      { title: "Laporan Gym", icon: "mdi-bone", to: "LaporanGym"},
      { title: "Laporan Instruktur", icon: "mdi-account-star", to: "LaporanInstruktur"},
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
  
