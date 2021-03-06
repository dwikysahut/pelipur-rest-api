const express = require('express');

const Route = express.Router();
const userController = require('../controllers/user');
const { authentication } = require('../middleware/auth');

Route
  .put('/:id', authentication, userController.updateUser)
  .put('/:id/password', authentication, userController.updatePassword)
  .get('/:id', authentication, userController.getUserById);
module.exports = Route;
