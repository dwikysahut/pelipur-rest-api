const express = require('express');

const Route = express.Router();
const dataController = require('../controllers/data');
const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/count', authentication, authorization, dataController.getAllDataCount);

module.exports = Route;
