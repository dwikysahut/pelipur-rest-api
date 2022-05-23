const bcrypt = require('bcrypt');
const userModel = require('../models/user');
const helper = require('../helpers');

module.exports = {
  getUserById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await userModel.getUserById(id);
      return helper.response(response, 200, { message: 'get Data user by id successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'error has occurred' }, error);
    }
  },
  updatePassword: async (request, response) => {
    try {
      const { id } = request.params;
      const { password } = request.body;
      const passwordHash = bcrypt.hashSync(password, 6);

      const result = await userModel.updatePassword(id, passwordHash);
      return helper.response(response, 200, { message: 'password updated successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'error on update password' }, error);
    }
  },
  updateUser: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;

      setData.image = `https://ui-avatars.com/api/?size=256&name=${setData.nama ? setData.nama : 'user'}`;

      const result = await userModel.updateUser(id, setData);
      return helper.response(response, 200, { message: 'update Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: `Failed to update,${error.message}` });
    }
  },
};
