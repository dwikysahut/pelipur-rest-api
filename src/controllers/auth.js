/* eslint-disable no-unused-vars */
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { nanoid } = require('nanoid');
const authModel = require('../models/auth');
const helper = require('../helpers');
require('dotenv').config();

module.exports = {
  createUser: async (request, response) => {
    try {
      const setData = request.body;
      setData.id = setData.id || nanoid(16);

      const emailChecked = await authModel.getUserByEmail(setData.email);

      if (emailChecked) {
        return helper.response(response, 409, {}, { message: 'email sudah digunakan' });
      }

      const { password } = setData;
      const hashPassword = bcrypt.hashSync(password, 6);
      console.log(hashPassword);
      setData.password = hashPassword;
      setData.image = `https://ui-avatars.com/api/?size=256&name=${setData.nama ? setData.nama : 'user'}`;

      const result = await authModel.createUser(setData);
      return helper.response(response, 200, result, { message: 'registrasi berhasil' });
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, error, { message: 'error' });
    }
  },
  loginUser: async (request, response) => {
    try {
      const getData = request.body;
      const result = await authModel.checkUser(getData);
      console.log(result);
      const compare = bcrypt.compareSync(getData.password, result.password);

      if (!compare) {
        return helper.response(response, 401, {}, { message: 'email atau password salah' });
      }

      delete result.password;
      const token = jwt.sign({ result }, process.env.SECRET_KEY, {
        expiresIn: '3d',
      });
      const refreshToken = jwt.sign(
        {
          result,
        },
        process.env.REFRESH_TOKEN_SECRET_KEY,
      );
      const newData = {
        ...result,
        token,
        refreshToken,
      };

      return helper.response(response, 200, newData, { message: 'login berhasil' });
    } catch (error) {
      return helper.response(response, 500, error, { message: 'error' });
    }
  },

};
