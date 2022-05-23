const express = require('express');

const Route = express.Router();
const collectionController = require('../controllers/collection');
const { authentication, authorization } = require('../middleware/auth');
// const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', authentication, authorization, collectionController.getAllCollections)
// .get('/:id', collectionController.getAllCollectionsByUserId)
  .get('/:id', authentication, collectionController.getCollectionsByUser)
  .post('/', authentication, collectionController.postCollection)
  .put('/confirmation/:id', collectionController.putCollection)
  .put('/:id', collectionController.putCollection);

module.exports = Route;
