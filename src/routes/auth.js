const express = require('express');

const Route = express.Router();
const authController = require('../controllers/auth');

Route
  .post('/register', authController.createUser)
  .post('/login', authController.loginUser);

module.exports = Route;
