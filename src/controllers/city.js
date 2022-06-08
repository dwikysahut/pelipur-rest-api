const cityModel = require('../models/city');
const helper = require('../helpers');

module.exports = {
  getAllCities: async (request, response) => {
    try {
      const result = await cityModel.getAllCities();

      return helper.response(response, 200, { message: 'Get All Cities Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'Failed to get all Cities' });
    }
  },
  getCityById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await cityModel.getCityById(id);
      // const newResult = JSON.parse(result.kota_jangkauan);
      // const array = newResult.map((kota) => parseInt(kota));
      // console.log(array);
      return helper.response(response, 200, { message: 'Get City Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to get City' });
    }
  },
  postCity: async (request, response) => {
    try {
      const setData = request.body;
      const result = await cityModel.postCity(setData);

      return helper.response(response, 200, { message: 'Add City Successfully' }, result);
    } catch (error) {
      console.log(error.message);
      return helper.response(response, 500, { message: 'Failed to add City' });
    }
  },
  putCity: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const result = await cityModel.putCity(id, setData);
      return helper.response(response, 200, { message: 'Edit City Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to edit City' });
    }
  },
  deleteCity: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await cityModel.deleteCity(id);
      return helper.response(response, 200, { message: 'Delete City Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to delete City' });
    }
  },
};
