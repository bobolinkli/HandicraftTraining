<template>
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>LC</v-app-bar-nav-icon>
                <v-toolbar-title>{{ lesson.name }}. Категория - {{ lesson.Category.name }}</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-layout>
                  <v-flex xs8>
                    <div class="lesson-name">
                      {{ lesson.name }}
                    </div>
                    <div class="lesson-description">
                      {{ lesson.description }}
                    </div>

                    <div class="lesson-content" v-html="lesson.content">
                    </div>
                    <div class="lesson-level">
                      Уровень сложности: {{ lesson.level }}
                    </div>
                    <div class="lesson-video">
                      <youtube :video-id="videoId"></youtube>
                    </div>
                    <div class="level">
                    </div>
                    <div class="lesson-category">
                      Категория - {{ lesson.Category.name }}
                    </div>
                    <div class="save-btn" v-if="userId">
                      <v-text-field
                        type="text"
                        name="user"
                        v-model="userId"
                        v-show="false"
                      />
                      <v-text-field
                        type="text"
                        v-model="lesson.id"
                        name="lesson"
                        v-show="false"
                      />
                      <v-btn class="save-btn" @click="create"
                      >
                        Сохранить
                      </v-btn>
                    </div>
                  </v-flex>
                  <v-flex xs4>
                    <v-img class="lesson-image" :src="lesson.image"/>
                  </v-flex>
                </v-layout>
              </v-card-text>
            </v-card>
          </div>
        </v-flex>
      </v-layout>
    </div>
  </div>
</template>

<script>
import LessonsService from '../services/LessonsService'
import {getIdFromURL} from 'vue-youtube-embed'
import AddMyLesson from '../services/AddMyLessonService'

export default {
  data() {
    return {
      lesson: {},
      videoId: null,
      userId: null,
      mylesson: {
        user: 1,
        lesson: 2
      }
    }
  },
  methods: {
    async create() {
      try {
        await AddMyLesson.post(this.mylesson)
        await this.$router.push({
          name: 'my-lessons'
        })
      } catch (err) {
        console.log(err)
      }
    }
  },
  async mounted() {
    const lessonId = this.$store.state.route.params.lessonId
    this.lesson = (await LessonsService.show(lessonId)).data
    this.videoId = getIdFromURL(this.lesson.video)
    this.userId = this.$store.state.user.id
    this.mylesson.user = this.userId
    this.mylesson.lesson = this.lesson.id
  }
}
</script>

<style scoped>
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
  font-weight: bolder;
  margin: 15px 15px 15px 0;
}

.lesson-content {
  font-size: 14px;
  text-align: justify;
  margin: 15px 15px 15px 0;
}

.lesson-category {
  font-size: 12px;
  font-weight: bold;
  color: blue;
  text-align: left;
  margin-top: 7px;
}

.lesson-level {
  font-size: 12px;
  font-weight: bold;
  color: blue;
  margin-bottom: 15px;
  text-align: left;
}

.lesson-video {
  margin-bottom: 30px;
}

.save-btn {
  float: right;
  margin-right: 25px;
}

</style>
