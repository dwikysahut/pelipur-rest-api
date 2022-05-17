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
};
