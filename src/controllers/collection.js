/* eslint-disable max-len */
const { nanoid } = require('nanoid');
const collectionModel = require('../models/collection');
const helper = require('../helpers');

module.exports = {
  getAllCollections: async (request, response) => {
    try {
      const result = await collectionModel.getAllCollections();
      console.log(result);

      return helper.response(response, 200, { message: 'get All Collections Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get all data collections' }, error.message);
    }
  },
  getCollectionsByUser: async (request, response) => {
    try {
      const idUser = request.token.result.id ? request.token.result.id : request.token.result.result.id;
      const result = await collectionModel.getCollectionsByUser(idUser);

      return helper.response(response, 200, { message: 'get Collections by user Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get collections' }, error.message);
    }
  },
  getCollectionById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await collectionModel.getCollectionById(id);

      return helper.response(response, 200, { message: 'get Collection by id Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get Collection' }, error.message);
    }
  },
  postCollection: async (request, response) => {
    try {
      const setData = request.body;
      setData.id_user = request.token.result.id ? request.token.result.id : request.token.result.result.id;
      setData.id = nanoid(16);
      setData.id_status = 1;

      const result = await collectionModel.postCollection(setData);

      return helper.response(response, 200, { message: 'post Collection Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to post collection' }, error.message);
    }
  },
  putCollection: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const result = await collectionModel.putCollection(id, setData);
      return helper.response(response, 200, { message: 'put Collection Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to put collection' }, error.message);
    }
  },
};
