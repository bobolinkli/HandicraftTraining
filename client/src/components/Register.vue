<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
    <v-layout column>
    <v-flex justify-center>
      <div class="white elevation-3">
        <v-card>
        <v-toolbar flat dense class="cyan" dark>
          <v-app-bar-nav-icon>R</v-app-bar-nav-icon>
          <v-toolbar-title>Register</v-toolbar-title>
        </v-toolbar>
          <v-form name="r-form" autocomplete="off">
          <v-card-text>
            <v-text-field
              type="email"
              label="Email"
              name="email"
              v-model="email"
              placeholder="email"
            />
            <v-text-field
              type="password"
              label="Password"
              v-model="password"
              name="password"
              placeholder="password"
            />
            <div class="error" v-html="error"/>
          </v-card-text>
          <v-card-actions>
              <v-flex justify-center>
                <v-btn
                  dark
                  @click="register"
                >
                  Register
                </v-btn>
              </v-flex>
          </v-card-actions>
          </v-form>
        </v-card>
      </div>
    </v-flex>
  </v-layout>
    </div>
  </div>
</template>

<script>
import AuthenticationService from '../services/AuthenticationService'

export default {
  data() {
    return {
      email: '',
      password: '',
      error: null
    }
  },
  methods: {
    async register() {
      try {
        const response = await AuthenticationService.register({
          email: this.email,
          password: this.password
        })
        await this.$store.dispatch('setToken', response.data.token)
        await this.$store.dispatch('setUser', response.data.user)
      } catch (error) {
        this.error = error.response.data.error
      }
    }
  }
}
</script>
<style scoped>
.error {
  color: red;
}
</style>
