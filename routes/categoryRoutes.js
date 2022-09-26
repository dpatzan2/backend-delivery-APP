const categoriesController = require('../Controllers/catgoriesController');
const passport = require('passport');

module.exports = (app) => {

    app.post('/api/categories/create', passport.authenticate('jwt', {session: false}), categoriesController.create);
    app.get('/api/categories/getAll', passport.authenticate('jwt', {session: false}), categoriesController.getAll);
}