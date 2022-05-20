const connection = require('../config/connection');

module.exports = {
  getAllPartners: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM mitra', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getPartnerById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM mitra where id=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  postPartner: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO mitra SET ?', setData, (error, result) => {
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
  putPartner: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE mitra set ? WHERE id=?', [setData, id], (error) => {
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
  deletePartner: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM mitra WHERE id=?', id, (error) => {
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
