<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>CL</v-app-bar-nav-icon>
                <v-toolbar-title>Добавить урок</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-text-field
                  type="text"
                  label="Наименование урока"
                  name="name"
                  required
                  :rules="[required]"
                  v-model="lesson.name"
                  placeholder="Название урока"
                />
                <v-text-field
                  type="text"
                  label="Описание урока"
                  v-model="lesson.description"
                  name="description"
                  placeholder="Описание урока"
                />
                <v-textarea
                  type="textarea"
                  label="Содержание урока"
                  v-model="lesson.content"
                  name="content"
                  placeholder="Содержание урока"
                />
                <v-text-field
                  type="text"
                  label="Ссылка на видеозапись"
                  v-model="lesson.video"
                  name="video"
                  placeholder="Ссыдка на видеозапись"
                />
                <v-text-field
                  type="text"
                  label="Схема"
                  v-model="lesson.image"
                  name="Схема"
                  placeholder="Схема (изображение)"
                />
                <v-text-field
                  type="text"
                  label="Уровень сложности"
                  v-model="lesson.level"
                  name="level"
                  placeholder="Уровень сложности"
                />
              </v-card-text>
              <label for="category" style="float: left; margin-left: 2.5%; margin-bottom: 5px;">Выберите
                категорию</label>
              <select v-model="lesson.category" id="category" style="background: #f5ead6; width: 95%; line-height: 40px;
               margin-bottom: 20px; border-bottom: 1px solid black">
                <option :value="null" disabled>Выберите категорию</option>
                <option v-for="category in categories" v-bind:key="category.name" v-bind:value="category.id">
                  {{ category.name }}
                </option>
              </select>
              <v-card-actions>
                <v-flex justify-center>
                  <v-btn
                    dark
                    @click="create"
                  >
                    Сохранить урок
                  </v-btn>
                  <div class="danger-alert" v-if="error">
                    {{ error }}
                  </div>
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
import LessonsService from '../services/LessonsService'
import CategoriesService from '../services/CategoriesService'

export default {
  data() {
    return {
      lesson: {
        name: null,
        description: null
      },
      categories: null,
      required: (value) => !!value || 'Обязательно к заполнению'
    }
  },
  async mounted() {
    this.categories = (await CategoriesService.index()).data
  },
  methods: {
    async create() {
      this.error = null
      const areAllFieldsFilledIn = Object.keys(this.lesson).every(key => !!this.lesson[key])
      if (!areAllFieldsFilledIn) {
        this.error = 'Пожалуйста, заполните все обязательные поля'
        return
      }
      try {
        await LessonsService.post(this.lesson)
        await this.$router.push({
          name: 'lessons'
        })
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>

<style scoped>
.danger-alert {
  color: red;
  font-size: 12px;
  margin-top: 15px;
}

</style>
