const express = require('express');

const Route = express.Router();
const newsController = require('../controllers/news');

Route
  .get('/', newsController.getAllNews)
  .get('/:id', newsController.getNewsById);

module.exports = Route;
