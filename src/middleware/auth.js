const jwt = require('jsonwebtoken');
const helper = require('../helpers');
require('dotenv').config();

module.exports = {
  authentication: (request, response, next) => {
    const token = request.headers.authorization;
    jwt.verify(token, process.env.SECRET_KEY, (error, result) => {
      if ((error && error.name === 'TokenExpiredError')
        || (error && error.name === 'JsonWebTokenError')) {
        helper.response(response, 401, {}, { message: error.name });
      } else {
        // console.log(result);
        request.token = result;
        next();
      }
    });
  },
  authorization: (request, response, next) => {
    const token = request.headers.authorization;
    jwt.verify(token, process.env.SECRET_KEY, (error, result) => {
      console.log(request.token);
      const role = request.token.result.id_role;
      if (role === 2) {
        helper.response(response, 401, {}, { message: 'You don\'t have access' });
      } else {
        request.token = result;
        next();
      }
    });
  },
  authRefreshToken: (request, response, next) => {
    const { token } = request.body;
    jwt.verify(token, process.env.REFRESH_TOKEN_SECRET_KEY, (error, result) => {
      if ((error && error.name === 'TokenExpiredError')
        || (error && error.name === 'JsonWebTokenError')) {
        helper.response(response, 401, {}, { message: error.name });
      } else {
        request.token = result;
        next();
      }
    });
  },
};
