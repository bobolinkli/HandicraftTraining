import Api from '../services/Api'

export default {
  post(mylesson) {
    return Api().post('my-lessons', mylesson)
  }
}
