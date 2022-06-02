const descModel = require('../models/description');
const helper = require('../helpers');

module.exports = {
  getAllDesc: async (request, response) => {
    try {
      const result = await descModel.getAllDesc();

      return helper.response(response, 200, { message: 'Get All Descriptions Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'Failed to get all Descriptions' });
    }
  },
  getDescById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await descModel.getDescById(id);
      // const newResult = JSON.parse(result.kota_jangkauan);
      // const array = newResult.map((kota) => parseInt(kota));
      // console.log(array);
      return helper.response(response, 200, { message: 'Get Description Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to get Description' });
    }
  },
  postDesc: async (request, response) => {
    try {
      const setData = request.body;
      const result = await descModel.postDesc(setData);

      return helper.response(response, 200, { message: 'Add Description Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'Failed to add Description' });
    }
  },
  putDesc: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const result = await descModel.putDesc(id, setData);
      return helper.response(response, 200, { message: 'Edit City Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to edit City' });
    }
  },
  deleteDesc: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await descModel.deleteDesc(id);
      return helper.response(response, 200, { message: 'Delete Description Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to delete Description' });
    }
  },
};
