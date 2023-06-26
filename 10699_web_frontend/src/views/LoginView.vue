<template>
  <div class="background">
    <div class="container">
      <v-card class="login-card" elevation="10">
        <form @submit.prevent="Login">
          <h1 class="login-title">Login Go-Fit</h1>
          <v-text-field
            v-model="inputLogin.username"
            label="Username"
            required
          ></v-text-field>
          <v-text-field
            v-model="inputLogin.password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :rules="[rules.required, rules.min]"
            :type="show1 ? 'text' : 'password'"
            label="Password"
            counter
            @click:append="show1 = !show1"
          ></v-text-field>
          <v-btn class="login-btn" type="submit" color="primary">Submit</v-btn>
        </form>
      </v-card>
    </div>
    <router-view></router-view>
    <v-snackbar v-model="snackbar">{{ error_message }}</v-snackbar>
  </div>
</template>

<script>
import { reactive, ref } from "vue";
import router from "../router/index";
import axios from "axios";

export default {
  data() {
    return {
      show1: false,
      snackbar: false,
      inputLogin: reactive({
        username: "",
        password: "",
      }),
      validation: ref([]),
      rules: {
        required: (value) => !!value || "Required.",
      },
    };
  },
  methods: {
    Login() {
      axios
        .post("http://127.0.0.1:8000/api/loginWeb", {
          username: this.inputLogin.username,
          password: this.inputLogin.password,
        })
        .then((response) => {
          localStorage.setItem("login", true);
          localStorage.setItem("datalogin", JSON.stringify(response.data.siganteng));
          console.log(response.data.siganteng);
          let role = response.data.user.role;
          this.snackbar = true;
          if (role == "mo") {
            router.push({ name: "mo" });
            alert("Berhasil Login");
          } else if (role == "admin") {
            router.push({ name: "admin" });
            alert("Berhasil Login");
          } else if (role == "kasir") {
            router.push({ name: "kasir" });
            alert("Berhasil Login");
          } else {
            alert("Gagal Login");
          }
        })
        .catch((error) => {
          console.log(error);
          console.log("Gagal");
          this.snackbar = true;
        });
    },
  },
};
</script>

<style scoped>
.background {
  height: 100vh;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.container {
  width: 100%;
  max-width: 500px;
}

.login-card {
  padding: 50px;
}

.login-title {
  margin-bottom: 20px;
  text-align: center;
}

.login-btn {
  width: 100%;
  margin-top: 20px;
}

@keyframes animatedBackground {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.background {
  animation: animatedBackground 10s ease infinite;
  background: linear-gradient(-45deg, #fc5c7d, #6a82fb, #05dfd7);
  background-size: 400% 400%;
}
</style>
