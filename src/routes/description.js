const express = require('express');

const Route = express.Router();
const descController = require('../controllers/description');
const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', authentication, descController.getAllDesc)
  .get('/:id', authentication, descController.getDescById)
  .post('/', authentication, authorization, descController.postDesc)
  .put('/:id', authentication, authorization, descController.putDesc)
  .delete('/:id', authentication, authorization, descController.deleteDesc);

module.exports = Route;
