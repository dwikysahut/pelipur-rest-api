/* eslint-disable radix */
const connection = require('../config/connection');

module.exports = {
  getAllCollections: () => new Promise((resolve, reject) => {
    connection.query('SELECT pengumpulan.id,user.nama as nama_user,pengumpulan.tanggal,pengumpulan.waktu,pengumpulan.pesan,pengumpulan.total_minyak,status.status,mitra.nama as nama_mitra,pengumpulan.date_added,pengumpulan.id_kota,kota.kota,pengumpulan.date_updated FROM pengumpulan INNER JOIN user ON pengumpulan.id_user = user.id INNER JOIN status ON pengumpulan.id_status = status.id LEFT JOIN mitra ON pengumpulan.id_mitra =  mitra.id INNER JOIN kota ON kota.id = pengumpulan.id_kota ORDER BY status,date_added', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getCollectionsByUser: (idUser) => new Promise((resolve, reject) => {
    connection.query('SELECT pengumpulan.id,user.nama as nama_user,pengumpulan.tanggal,pengumpulan.waktu,pengumpulan.pesan,pengumpulan.total_minyak,status.status,mitra.nama as nama_mitra,pengumpulan.date_added,pengumpulan.id_kota,kota.kota,pengumpulan.date_updated FROM pengumpulan INNER JOIN user ON pengumpulan.id_user = user.id INNER JOIN status ON pengumpulan.id_status = status.id LEFT JOIN mitra ON pengumpulan.id_mitra =  mitra.id INNER JOIN kota ON kota.id = pengumpulan.id_kota where user.id = ? ORDER BY status,date_added', idUser, (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(new Error(error));
      }
    });
  }),
  getCollectionById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT pengumpulan.id,user.nama as nama_user,pengumpulan.tanggal,pengumpulan.waktu,pengumpulan.pesan,pengumpulan.total_minyak,status.status,mitra.nama as nama_mitra,pengumpulan.date_added,pengumpulan.id_kota,kota.kota,pengumpulan.date_updated FROM pengumpulan INNER JOIN user ON pengumpulan.id_user = user.id INNER JOIN status ON pengumpulan.id_status = status.id LEFT JOIN mitra ON pengumpulan.id_mitra =  mitra.id INNER JOIN kota ON kota.id = pengumpulan.id_kota where pengumpulan.id = ? ORDER BY status,date_added', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  postCollection: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO pengumpulan SET ?', setData, (error) => {
      if (!error) {
        const newData = {
          ...setData,
          id_mitra: parseInt(setData.id_mitra),
        };
        resolve(newData);
      } else {
        reject(new Error(error));
      }
    });
  }),
  putCollection: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE pengumpulan SET ? WHERE id=?', [setData, id], (error) => {
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
};
