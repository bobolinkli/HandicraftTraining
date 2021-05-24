import Api from '../services/Api'

export default {
  index() {
    return Api().get('lessons')
  },
  show(lessonId) {
    return Api().get(`lessons/${lessonId}`)
  },
  mylessons(userId) {
    return Api().get(`my-lessons/${userId}`)
  },
  post(lesson) {
    return Api().post('lessons', lesson)
  }
}
