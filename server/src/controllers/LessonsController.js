const { Lesson, Category } = require('../models')
module.exports = {
    async index(req, res) {
        try {
            const lessons = await Lesson.findAll({
                include: [{ model: Category }],
                limit: 20
            })
            res.send(lessons)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка получения уроков'
            })
        }
    },
    async show(req, res) {
        try {
            const lesson = await Lesson.findByPk(req.params.lessonId, {
                include: [{ model: Category }]
            })
            res.send(lesson)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка получения урока'
            })
        }
    },
    async post(req, res) {
        try {
            const lesson = await Lesson.create(req.body)
            res.send(lesson)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка добавления урока'
            })
        }
    }
}
