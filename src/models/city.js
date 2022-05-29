const connection = require('../config/connection');

module.exports = {
  getAllCities: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM kota', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getCityById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM kota where id=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  postCity: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO kota SET ?', setData, (error, result) => {
      if (!error) {
        const newData = {
          id: result.insertId,
          ...setData,
        };
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
  putCity: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE kota set ? WHERE id=?', [setData, id], (error) => {
      if (!error) {
        const newData = {
          id,
          ...setData,
        };
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
  deleteCity: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM kota WHERE id=?', id, (error) => {
      if (!error) {
        const newData = {
          id,
        };
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getCitiesCount: () => new Promise((resolve, reject) => {
    connection.query('SELECT COUNT(id) as total_kota from kota', (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),

};
