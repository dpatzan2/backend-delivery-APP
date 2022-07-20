const userController = require('../Controllers/usersController');
const passport = require('passport');

module.exports = (app, upload) => {

    app.post('/api/users/create', userController.register);
    app.post('/api/users/login', userController.login);
    app.post('/api/users/createImage', upload.array('image', 1), userController.registerWithImage);

    
    app.put("/api/users/update", passport.authenticate('jwt', {session: false}), upload.array('image', 1), userController.updateWithImage);
    app.put("/api/users/updateWithoutImage", passport.authenticate('jwt', {session: false}), userController.updateWithoutImage);
}