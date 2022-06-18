const connection = require('../config/connection');

module.exports = {
  getAllNews: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM berita', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getNewsById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM berita where id=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
};
