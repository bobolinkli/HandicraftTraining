import Api from '../services/Api'

export default {
  index() {
    return Api().get('categories')
  },
  show(categoryId) {
    return Api().get(`categories/${categoryId}`)
  },
  post(category) {
    return Api().post('categories', category)
  }
}
