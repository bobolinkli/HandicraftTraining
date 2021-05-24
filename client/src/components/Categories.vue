<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>C</v-app-bar-nav-icon>
                <v-toolbar-title>Категории</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-btn
                  :dark="true"
                  fab
                  title="Добавить товар"
                  to="categories/create"
                  depressed
                  color="primary"
                  v-if="$store.state.isUserLoggedIn && $store.state.user.email === 'kopzova@mail.ru'"
                >
                  +
                </v-btn>
              </v-toolbar>
              <div v-for="category in categories" :key="category.name" class="category">
                <v-layout>
                  <v-flex xs12>
                    <div class="category-name">
                      {{ category.name }}
                    </div>
                    <div class="category-description">
                      {{ category.description }}
                    </div>
                    <v-btn class="category-btn"
                           @click="navigateTo({
                      name: 'category',
                      params: {
                        categoryId: category.id
                      }
                      })"
                    >
                      Открыть уроки категории
                    </v-btn>
                  </v-flex>
                </v-layout>
              </div>
            </v-card>
          </div>
        </v-flex>
      </v-layout>
    </div>
  </div>
</template>

<script>
import CategoriesService from '../services/CategoriesService'

export default {
  methods: {
    navigateTo(route) {
      this.$router.push(route)
    }
  },
  data() {
    return {
      categories: null
    }
  },
  async mounted() {
    this.categories = (await CategoriesService.index()).data
  }
}
</script>

<style scoped>
.category {
  padding: 20px;
  min-height: 100px;
  overflow: hidden;
}

.category-name {
  font-size: 24px;
}

.category-description {
  font-size: 14px;
  text-align: justify;
  margin: 15px 15px 15px 0;
}
.category-btn {
  margin-top: 10px;
}
</style>
