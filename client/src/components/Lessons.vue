<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>L</v-app-bar-nav-icon>
                <v-toolbar-title>Уроки</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-btn
                  :dark="true"
                  fab
                  title="Добавить урок"
                  to="lessons/create"
                  v-if="$store.state.isUserLoggedIn && $store.state.user.email === 'kopzova@mail.ru'"
                >
                  +
                </v-btn>
              </v-toolbar>
              <div v-for="lesson in lessons" :key="lesson.name" class="lesson">
                <v-layout>
                  <v-flex xs8>
                    <div class="lesson-name">
                      {{ lesson.name }}
                    </div>
                    <div class="lesson-description">
                      {{ lesson.description }}
                    </div>
                    <div class="lesson-category">
                      Категория - {{ lesson.Category.name }}
                    </div>
                    <v-btn class="lesson-btn"
                           @click="navigateTo({
                      name: 'lesson',
                      params: {
                        lessonId: lesson.id
                      }
                      })"
                    >
                      Открыть урок
                    </v-btn>
                  </v-flex>
                  <v-flex xs4>
                    <v-img class="lesson-image" :src="lesson.image"/>
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
import LessonsService from '../services/LessonsService'

export default {
  methods: {
    navigateTo(route) {
      this.$router.push(route)
    }
  },
  data() {
    return {
      lessons: null
    }
  },
  async mounted() {
    this.lessons = (await LessonsService.index()).data
  }
}
</script>

<style scoped>
.lesson {
  padding: 20px;
  min-height: 250px;
  overflow: hidden;
}

.lesson-image {
  margin-top: 20px;
  margin-right: 20px;
}

.lesson-name {
  font-size: 24px;
}

.lesson-description {
  font-size: 14px;
  text-align: justify;
  margin: 15px 15px 15px 0;
}

.lesson-category {
  font-size: 12px;
  font-weight: bold;
  color: blue;
}

.lesson-btn {
  margin-top: 10px;
}

</style>
