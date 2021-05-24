import Vue from 'vue'
import Router from 'vue-router'
import Register from '../components/Register'
import Login from '../components/Login'
import Categories from '../components/Categories'
import CreateCategory from '../components/CreateCategory'
import Lessons from '../components/Lessons'
import MyLessons from '../components/MyLessons'

import CreateLesson from '../components/CreateLesson'
import ViewLesson from '../components/ViewLesson'
import ViewCategory from '../components/ViewCategory'
import MainPage from '../components/MainPage'

import VueYouTubeEmbed from 'vue-youtube-embed'

Vue.use(Router)
Vue.use(VueYouTubeEmbed)
// if you don't want install the component globally
Vue.use(VueYouTubeEmbed, { global: false })
// if you want to install the component globally with a different name
Vue.use(VueYouTubeEmbed, { global: true, componentId: 'youtube-media' })
export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/main'
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/categories',
      name: 'categories',
      component: Categories
    },
    {
      path: '/categories/create',
      name: 'categories-create',
      component: CreateCategory
    },
    {
      path: '/lessons',
      name: 'lessons',
      component: Lessons
    },
    {
      path: '/my-lessons',
      name: 'my-lessons',
      component: MyLessons
    },
    {
      path: '/lessons/create',
      name: 'lessons-create',
      component: CreateLesson
    },
    {
      path: '/lessons/:lessonId',
      name: 'lesson',
      component: ViewLesson
    },
    {
      path: '/categories/:categoryId',
      name: 'category',
      component: ViewCategory
    },
    {
      path: '/main',
      name: 'main',
      component: MainPage
    }
  ]
})
