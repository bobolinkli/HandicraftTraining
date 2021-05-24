module.exports = {
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": "standard",
    rules: {
        // allow paren-less arrow functions
        'arrow-parens': 0,
        'indent': 'off',
        // allow debugger during development
        'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
        "space-before-function-paren": ["error", "never"],
        // allow async-await
        'generator-star-spacing': 'off'
    }
};
