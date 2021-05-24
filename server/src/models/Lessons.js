'use strict'
module.exports = (sequelize, DataTypes) => {
    const Category = sequelize.define('Category', {/* attributes */})
    const Lesson = sequelize.define('Lesson', {
        name: DataTypes.STRING,
        description: DataTypes.STRING,
        content: DataTypes.TEXT,
        video: DataTypes.STRING,
        image: DataTypes.STRING,
        level: DataTypes.STRING,
        category: DataTypes.INTEGER,
        createdAt: DataTypes.DATE,
        updatedAt: DataTypes.DATE
    })
    Lesson.belongsTo(Category, { foreignKey: 'category', targetKey: 'id' })
    return Lesson
}
