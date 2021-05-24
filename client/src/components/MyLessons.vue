<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>MY</v-app-bar-nav-icon>
                <v-toolbar-title>Уроки пользователя - {{ userName }}
                </v-toolbar-title>
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

              <div v-for="mylesson in mylessons" :key="mylesson.user" class="lesson">
                <v-layout>
                  <v-flex xs8>
                    <div class="lesson-name">
                      {{ mylesson.Lesson.name }}
                    </div>
                    <div class="lesson-description">
                      {{ mylesson.Lesson.description }}
                    </div>
                    <div class="lesson-category">
                      Категория - {{ mylesson.Lesson.Category.name }}
                    </div>
                    <div class="lesson-level">
                      Уровень сложности: {{ mylesson.Lesson.level }}
                    </div>
                    <v-btn class="lesson-btn"
                           @click="navigateTo({
                      name: 'lesson',
                      params: {
                        lessonId: mylesson.Lesson.id
                      }
                      })"
                    >
                      Открыть урок
                    </v-btn>
                  </v-flex>
                  <v-flex xs4>
                    <v-img class="lesson-image" :src="mylesson.Lesson.image"/>
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
      mylessons: null,
      userId: this.$store.state.user.id,
      userName: this.$store.state.user.email
    }
  },
  async mounted() {
    this.mylessons = (await LessonsService.mylessons(this.userId)).data
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
  text-align: left;
}

.lesson-level {
  font-size: 12px;
  font-weight: bold;
  color: blue;
  margin: 15px 0 15px 0;
  text-align: left;
}

.lesson-btn {
  margin-top: 10px;
}

</style>
