const express = require('express');

const Route = express.Router();
const collectionController = require('../controllers/user');
// const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', collectionController.getAllCollections)
  // .get('/:id', collectionController.getAllCollectionsByUserId)
  .get('/:id', collectionController.getCollectionById)
  .post('/', collectionController.postCollection)
  .put('/:id', collectionController.putCollection);

module.exports = Route;
