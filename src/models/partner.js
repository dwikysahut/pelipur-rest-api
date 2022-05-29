const fs = require('fs');
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

  getPartnerByCity: (kota) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM mitra where kota_jangkauan LIKE "%?%"', kota, (error, result) => {
      if (!error) {
        resolve(result);
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
  deletePartnerImage: (image) => new Promise((resolve, reject) => {
    if (image) {
      fs.unlink(`./public/image/${image}`, (error) => {
        if (error) reject(new Error(error));
        resolve(console.log('delete file Successfully'));
      });
    }
  }),
  getPartnersCount: () => new Promise((resolve, reject) => {
    connection.query('SELECT COUNT(id) as total_mitra from mitra', (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
};
