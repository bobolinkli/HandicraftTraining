<template>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
      <v-layout column>
        <v-flex justify-center>
          <div class="white elevation-3">
            <v-card>
              <v-toolbar flat dense class="cyan" dark>
                <v-app-bar-nav-icon>M</v-app-bar-nav-icon>
                <v-toolbar-title>Главная страница</v-toolbar-title>
                <v-spacer></v-spacer>
              </v-toolbar>
              <div class="lesson">
                <v-layout>
                  <v-flex xs8>
                    <div class="main-name">
                      Обучающие уроки по рукоделию HandicraftTraining
                    </div>
                    <div class="main-header">
                      Добро пожаловать!
                    </div>
                    <div class="main-content">
                      <p class="main-text"> Обучение хобби нельзя относить к стандартной учебе, потому что человек
                        занимается этим не
                        для
                        пользы в будущем, а для собственного удовольствия. Подобрав рукоделие по душе, со временем оно
                        перерастает в хобби и дает шанс одним шагом расслабиться и самореализоваться, это отменный
                        способ
                        расширить круг друзей и дать выход своему творчеству.</p>
                      <p class="main-text">
                        Мы предлагаем обучение хобби начинать с самых азов. Наши уроки раскрывают историю, интересные
                        факты и, самое главное, мы разработали уроки с подробными инструкциями по созданию изделий
                        разного
                        уровня сложности. Если вы в поиске, то пошаговые фото и фото готовых работ помогут выбрать
                        рукоделие и хобби самое близкое вашему настроению и темпераменту. Обучаясь на нашем сайте, вы
                        получите массу наслаждения не только от уроков и курсов, но и от возможности поделиться своими
                        знаниями и взять что-то новое для себя.</p>
                    </div>
                  </v-flex>
                  <v-flex xs4>
                    <v-img class="main-image" :src="`static/img/firstimg.jpg`"/>
                    <br>
                    <v-img class="main-image" :src="`static/img/secondimg.jpg`"/>
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
export default {
  data() {
    return {
      publicPath: process.env.BASE_URL
    }
  }
}
</script>

<style scoped>
.lesson {
  padding: 20px;
  min-height: 250px;
  overflow: hidden;
}

.main-image {
  margin-top: 20px;
  margin-right: 20px;
}

.main-header {
  font-size: 24px;
  margin-top: 20px;

}

.main-content {
  font-size: 14px;
  text-align: justify;
  margin: 15px 15px 15px 0;
}

.main-name {
  font-size: 24px;
  font-weight: bold;
}
.main-text{
  font-size: 16px;
  line-height: 30px;
  margin-top: 20px;
}

</style>
