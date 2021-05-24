<template>
  <v-toolbar
    color="primary"
    dark
    flat dense>
    <v-toolbar-title>
      <span
        class="home"
        @click="navigateTo({name: 'main'})">
      HandicraftTrainings
      </span>
    </v-toolbar-title>
    <v-toolbar-items>
      <v-btn
        @click="navigateTo({name: 'categories'})"
      >
        Категории
      </v-btn>
    </v-toolbar-items>
    <v-toolbar-items>
      <v-btn
        @click="navigateTo({name: 'lessons'})"
      >
        Уроки
      </v-btn>
    </v-toolbar-items>
    <v-toolbar-items>
      <v-btn
        @click="navigateTo({name: 'my-lessons'})"
        v-if="$store.state.isUserLoggedIn"
      >
        Мои уроки
      </v-btn>
    </v-toolbar-items>
    <v-spacer></v-spacer>
    <v-toolbar-items>
      <v-btn
        @click="navigateTo({name: 'register'})"
        v-if="!$store.state.isUserLoggedIn"
      >
        Регистрация
      </v-btn>
      <v-btn
        @click="navigateTo({name: 'login'})"
        v-if="!$store.state.isUserLoggedIn"
      >
        Вход
      </v-btn>
      <v-btn
        @click="logout"
        v-if="$store.state.isUserLoggedIn"
      >
        Выйти
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>
</template>

<script>
export default {
  methods: {
    navigateTo(route) {
      this.$router.push(route)
    },
    logout() {
      this.$store.dispatch('setToken', null)
      this.$store.dispatch('setUser', null)
      this.$router.push({
        name: 'root'
      })
    }

  }
}
</script>
<style scoped>
.home {
  cursor: pointer;
}

.home:hover {
  color: brown;
}
</style>
