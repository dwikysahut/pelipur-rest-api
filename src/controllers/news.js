const newsModel = require('../models/news');
const helper = require('../helpers');

module.exports = {
  getAllNews: async (request, response) => {
    try {
      const result = await newsModel.getAllNews();

      return helper.response(response, 200, { message: 'Get All News Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'Failed to get all News' });
    }
  },
  getNewsById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await newsModel.getNewsById(id);
      return helper.response(response, 200, { message: 'Get News Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to get News' });
    }
  },

};
