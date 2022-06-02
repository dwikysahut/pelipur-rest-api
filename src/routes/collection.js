const express = require('express');

const Route = express.Router();
const collectionController = require('../controllers/collection');
const { authentication, authorization } = require('../middleware/auth');
// const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', authentication, authorization, collectionController.getAllCollections)
  .get('/:id', collectionController.getCollectionById)
  .get('/users/:id', authentication, collectionController.getCollectionsByUser)
  .post('/', authentication, collectionController.postCollection)
  .put('/confirmation/:id', authentication, authorization, collectionController.confirmCollection)
  .put('/:id', authentication, authorization, collectionController.putCollection);

module.exports = Route;
