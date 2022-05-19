const express = require('express');

const Route = express.Router();
const authController = require('../controllers/auth');
const { authRefreshToken } = require('../middleware/auth');

Route
  .post('/register', authController.createUser)
  .post('/login', authController.loginUser)
  .post('/refresh-token', authRefreshToken, authController.refreshToken)
  .post('/logout', authController.deleteToken)
  .post('/forgot-password', authController.forgotPassword);

module.exports = Route;
