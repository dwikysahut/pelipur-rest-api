/* eslint-disable no-mixed-operators */
const connection = require('../config/connection');
require('dotenv').config();

module.exports = {

  updatePassword: (id, password) => new Promise((resolve, reject) => {
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
  updateUser: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE user SET ? WHERE id=?', [setData, id], (error) => {
      if (!error) {
        const newData = {
          id,
          ...setData,
        };
        delete newData.password;
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getUserById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM user where id=? ', id, (error, result) => {
      if (!error) {
        const newData = {
          ...result[0],
        };
        delete newData.password;
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
};
