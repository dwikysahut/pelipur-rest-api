const connection = require('../config/connection');

module.exports = {
  getAllDesc: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM keterangan', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getDescById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM keterangan where id=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  postDesc: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO keterangan SET ?', setData, (error, result) => {
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
  putDesc: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE keterangan set ? WHERE id=?', [setData, id], (error) => {
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
  deleteDesc: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM keterangan WHERE id=?', id, (error) => {
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
 

};
