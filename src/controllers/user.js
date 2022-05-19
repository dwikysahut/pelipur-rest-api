const bcrypt = require('bcrypt');
const userModel = require('../models/user');
const helper = require('../helpers');

module.exports = {
  getUserById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await userModel.getUserById(id);
      return helper.response(response, 200, result, { message: 'get Data user by id successfully' });
    } catch (error) {
      return helper.response(response, 500, error, { message: 'error has occurred' });
    }
  },
  updatePassword: async (request, response) => {
    try {
      const { id } = request.params;
      const { password } = request.body;
      const passwordHash = bcrypt.hashSync(password, 6);

      const result = await userModel.updatePassword(id, passwordHash);
      return helper.response(response, 200, result, { message: 'password updated successfully' });
    } catch (error) {
      return helper.response(response, 500, error, { message: 'error on update password' });
    }
  },
  updateUser: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;

      const result = await userModel.updateUser(id, setData);
      return helper.response(response, 200, result, { message: 'update Successfully' });
    } catch (error) {
      return helper.response(response, 500, error, { message: 'Failed to update' });
    }
  },
};
