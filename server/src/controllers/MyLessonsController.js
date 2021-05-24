const { MyLesson, Lesson, Category } = require('../models')
module.exports = {
    async userlessons(req, res) {
        try {
            const mylessons = await MyLesson.findAll({
                include: [{ model: Lesson, include: [{ model: Category }] }],
                where: { user: req.params.userId },
                limit: 20
            })
            res.send(mylessons)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка получения уроков'
            })
        }
    },
    async post(req, res) {
        try {
            const mylesson = await MyLesson.create(req.body)
            res.send(mylesson)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка сохранинея урока'
            })
        }
    }
}
