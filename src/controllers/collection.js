const collectionModel = require('../models/collection');
const helper = require('../helpers');

module.exports = {
  getAllCollections: async (request, response) => {
    try {
      const result = await collectionModel.getAllCollections();

      return helper.response(response, 200, { message: 'get All Collections Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get all data collections' }, error);
    }
  },
};
