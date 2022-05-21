/* eslint-disable no-else-return */
/* eslint-disable no-unused-vars */
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { nanoid } = require('nanoid');
const generator = require('generate-password');
const authModel = require('../models/auth');
const helper = require('../helpers');
require('dotenv').config();

const refreshTokens = [];
module.exports = {
  createUser: async (request, response) => {
    try {
      const setData = request.body;
      setData.id = setData.id || nanoid(16);

      const emailChecked = await authModel.getUserByEmail(setData.email);

      if (emailChecked) {
        return helper.response(response, 409, { message: 'Email already Exists' });
      }

      const { password } = setData;
      const hashPassword = bcrypt.hashSync(password, 6);
      console.log(hashPassword);
      setData.password = hashPassword;
      setData.image = `https://ui-avatars.com/api/?size=256&name=${setData.nama ? setData.nama : 'user'}`;
      const randomCode = helper.random(6);
      const randomCodeHash = bcrypt.hashSync(randomCode, 6);
      setData.kode_verif = randomCodeHash;
      const result = await authModel.createUser(setData);
      const htmlTemplate = `<center><h2>Your verification code</h2><hr><h4>code : ${randomCode}</h4></center>`;
      helper.nodemailer(result.email, 'Verification code', htmlTemplate);
      return helper.response(response, 200, { message: 'Register Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'error' }, error);
    }
  },
  loginUser: async (request, response) => {
    try {
      const getData = request.body;
      const result = await authModel.checkUser(getData);
      if (!result) {
        return helper.response(response, 401, { message: 'Invalid Email' });
      } else if (result.verified === 'false') {
        return helper.response(response, 401, { message: 'Email does not verify, Please verify your account first' });
      }

      const compare = bcrypt.compareSync(getData.password, result.password);

      if (!compare) {
        return helper.response(response, 401, { message: 'Invalid Password' });
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
      refreshTokens.push(refreshToken);
      return helper.response(response, 200, { message: 'login Successfully' }, newData);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to login' });
    }
  },
  refreshToken: async (request, response) => {
    try {
      const { token } = request.body;
      if (!refreshTokens.includes(token)) {
        return helper.response(response, 403, { message: 'Token Null, Please Login' });
      }
      const result = await authModel.refreshToken(token);
      console.log(result);
      if (result === undefined) {
        return helper.response(response, 401, { message: 'invalid username or password' });
      } else {
        const newToken = jwt.sign({ result }, process.env.SECRET_KEY, {
          expiresIn: '3d',
        });
        const newRefreshToken = jwt.sign({ result }, process.env.REFRESH_TOKEN_SECRET_KEY);
        const newResult = {
          token: newToken,
          refreshToken: newRefreshToken,
        };
        refreshTokens.shift();
        refreshTokens.push(newRefreshToken);
        return helper.response(response, 200, { message: 'Token renew successfully' }, newResult);
      }
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, {
        message: `Failed to refresh token ${error.message}`,
      });
    }
  },
  deleteToken: async (request, response) => {
    try {
      refreshTokens.filter((token) => token !== request.body.token);
      return helper.response(response, 200, { message: 'logout successfully' });
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to logout' });
    }
  },
  forgotPassword: async (request, response) => {
    try {
      const { email } = request.body;
      const result = await authModel.getUserByEmail(email);
      // console.log(result);
      if (!result) {
        return helper.response(response, 403, { message: 'email doesn\'t exists' });
      }
      const newPassword = generator.generate({
        length: 10,
        numbers: true,
      });
      const newPasswordHash = bcrypt.hashSync(newPassword, 6);
      await authModel.resetPassword(result.id, newPasswordHash);
      const htmlTemplate = `<center><h2>Here's your new password</h2><hr>new password : <h4>${
        newPassword
      }</h4></center>`;

      const emailSent = await helper.nodemailer(result.email, 'Password Recovery Pelipur App', htmlTemplate);

      return helper.response(response, 200, {
        message: 'Your Password has been sent to your email',
      });
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'error to send password' });
    }
  },
  verifyUser: async (request, response) => {
    try {
      const setData = request.body;

      const userChecked = await authModel.checkUser(setData);
      if (!userChecked) {
        return helper.response(response, 401, { message: 'Email not found' });
      }
      const compare = bcrypt.compareSync(setData.kode, userChecked.kode_verif);
      if (!compare) {
        return helper.response(response, 401, { message: 'Invalid verification code' });
      } else {
        const result = await authModel.verifyUser(setData.email);
        return helper.response(response, 200, { message: 'Account Verified' }, result);
      }
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: error.message });
    }
  },

};
