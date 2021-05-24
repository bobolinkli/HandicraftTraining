const AuthenticationController = require('./controllers/AuthenticationController')
const AuthenticationControllerPolicy = require('./policies/AuthenticationControllerkPolicy')
const CategoriesController = require('./controllers/CategoriesController')
const LessonsController = require('./controllers/LessonsController')
const MyLessonsController = require('./controllers/MyLessonsController')

module.exports = (app) => {
    app.post('/register',
        AuthenticationControllerPolicy.register,
        AuthenticationController.register)

    app.post('/login',
        AuthenticationController.login)

    app.get('/categories',
        CategoriesController.index)
    app.post('/categories',
        CategoriesController.post)

    app.get('/lessons',
        LessonsController.index)
    app.post('/lessons',
        LessonsController.post)
    app.get('/lessons/:lessonId', LessonsController.show)
    app.get('/categories/:categoryId', CategoriesController.show)
    app.get('/my-lessons/:userId', MyLessonsController.userlessons)
    app.post('/my-lessons', MyLessonsController.post)
}
