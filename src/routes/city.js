const express = require('express');

const Route = express.Router();
const cityController = require('../controllers/city');
const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', cityController.getAllCities)
  .get('/:id', authentication, cityController.getCityById)
  .post('/', authentication, authorization, cityController.postCity)
  .put('/:id', authentication, authorization, cityController.putCity)
  .delete('/:id', authentication, authorization, cityController.deleteCity);

module.exports = Route;
