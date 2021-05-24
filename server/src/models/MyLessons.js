'use strict'
module.exports = (sequelize, DataTypes) => {
    const Lesson = sequelize.define('Lesson', {/* attributes */})
    const User = sequelize.define('User', {/* attributes */})
    const MyLesson = sequelize.define('MyLesson', {
        user: DataTypes.INTEGER,
        lesson: DataTypes.INTEGER,
        createdAt: DataTypes.DATE,
        updatedAt: DataTypes.DATE
    })
    MyLesson.belongsTo(Lesson, { foreignKey: 'lesson', targetKey: 'id' })
    MyLesson.belongsTo(User, { foreignKey: 'user', targetKey: 'id' })
    return MyLesson
}
