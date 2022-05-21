/* eslint-disable no-mixed-operators */
const jwt = require('jsonwebtoken');
const connection = require('../config/connection');
require('dotenv').config();

module.exports = {
  getUserByEmail: (email) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM user WHERE email=?', email, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  createUser: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO user set ?', setData, (error, result) => {
      if (!error) {
        const newResult = {
          id: result.insertId,
          ...setData,
        };
        delete newResult.password;
        resolve(newResult);
      } else {
        reject(new Error(error));
      }
    });
  }),
  checkUser: (getData) => new Promise((resolve, reject) => {
    connection.query('SELECT * from user where email=?', getData.email, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  refreshToken: (token) => new Promise((resolve, reject) => {
    jwt.verify(token, process.env.REFRESH_TOKEN_SECRET_KEY, (error, result) => {
      if (error && error.name === 'TokenExpiredError' || error && error.name === 'JsonWebTokenError') {
        reject(new Error(error));
      } else {
        resolve(result.result);
      }
    });
  }),
  resetPassword: (id, password) => new Promise((resolve, reject) => {
    connection.query(`UPDATE user SET password='${password}' WHERE id=?`, id, (error) => {
      if (!error) {
        const newResult = {
          id,
        };
        resolve(newResult);
      } else {
        reject(new Error(error));
      }
    });
  }),
  verifyUser: (email) => new Promise((resolve, reject) => {
    connection.query("UPDATE user SET verified='true' WHERE email=?", email, (error, result) => {
      if (!error) {
        const newData = {
          email,
          result,
        };
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
};
