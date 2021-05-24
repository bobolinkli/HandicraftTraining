<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>CC</v-app-bar-nav-icon>
                <v-toolbar-title>Добавить категорию</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-text-field
                  type="text"
                  label="Категория"
                  name="name"
                  v-model="category.name"
                  placeholder="Название категории"
                />
                <v-text-field
                  type="text"
                  label="Описание категории"
                  v-model="category.description"
                  name="description"
                  placeholder="Описание категории"
                />
              </v-card-text>
              <v-card-actions>
                <v-flex justify-center>
                  <v-btn
                    dark
                    @click="create"
                  >
                    Сохранить категорию
                  </v-btn>
                </v-flex>
              </v-card-actions>
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
  data() {
    return {
      category: {
        name: null,
        description: null
      }
    }
  },
  methods: {
    async create() {
      try {
        await CategoriesService.post(this.category)
        await this.$router.push({
          name: 'categories'
        })
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>

<style scoped>

</style>
