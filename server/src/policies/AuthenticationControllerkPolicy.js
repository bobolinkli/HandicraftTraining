const Joi = require('joi')
module.exports = {
    register(req, res, next) {
        const schema = Joi.object({
            email: Joi.string().email(),
            password: Joi.string().min(6).required()
        })
        const { error } = schema.validate(req.body)
        if (error) {
            switch (error.details[0].context.key) {
                case 'email':
                    res.status(400).send({
                        error: 'You must provide a valid email address'
                    })
                    break
                case 'password':
                    res.status(400).send({
                        error: 'The password must be at least 6 characters in length'
                    })
                    break
                default:
                    res.status(400).send({
                        error: 'Invalid registration information'
                    })
            }
        } else {
            next()
        }
    }
}
