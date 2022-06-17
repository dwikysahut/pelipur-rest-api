const express = require('express');

const Route = express.Router();
const dataController = require('../controllers/data');
const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/count', authentication, authorization, dataController.getAllDataCount)
  .get('/count/collections-month', dataController.getCollectionsByMonth);

module.exports = Route;
