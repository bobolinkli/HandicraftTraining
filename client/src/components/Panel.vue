<template>
  <div class="row">
    <div class="col-md-12">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense>
                <v-app-bar-nav-icon>{{ letter }}</v-app-bar-nav-icon>
                <v-toolbar-title>{{ title }}</v-toolbar-title>
                <v-spacer></v-spacer>
                <slot name="add-action"></slot>
              </v-toolbar>
              <v-card-text>
                <v-card-text>
                  <slot>
                    No slot content defined
                  </slot>
                </v-card-text>
            </v-card>
          </div>
        </v-flex>
      </v-layout>
    </div>
  </div>
</template>

<script>

export default {
  props: [
    'title',
    'letter'
  ]
}
</script>

<style scoped>
.text-right {
  float: right;
}
</style>
