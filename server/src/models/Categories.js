module.exports = (sequalize, DataTypes) => {
    return sequalize.define('Category', {
        name: DataTypes.STRING,
        description: DataTypes.TEXT
    })
}
