const { Category, Lesson } = require('../models')
module.exports = {
    async index(req, res) {
        try {
            const categories = await Category.findAll({
                limit: 20
            })
            res.send(categories)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка получения категорий'
            })
        }
    },
    async show(req, res) {
        try {
            const categorylesson = await Lesson.findAll({
                include: [{ model: Category, where: { id: req.params.categoryId } }]
            })
            res.send(categorylesson)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка получения уроков категории'
            })
        }
    },
    async post(req, res) {
        try {
            const category = await Category.create(req.body)
            res.send(category)
        } catch (err) {
            res.status(500).send({
                error: 'Ошибка добавления категории'
            })
        }
    }
}
