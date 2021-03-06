/* eslint-disable max-len */
const { nanoid } = require('nanoid');
const collectionModel = require('../models/collection');
const partnerModel = require('../models/partner');
const helper = require('../helpers');

module.exports = {
  getAllCollections: async (request, response) => {
    try {
      const result = await collectionModel.getAllCollections();
      console.log(result);

      return helper.response(response, 200, { message: 'get All Collections Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get all data collections' }, error.message);
    }
  },
  getCollectionsByUser: async (request, response) => {
    try {
      const idUser = request.token.result.id ? request.token.result.id : request.token.result.result.id;
      const result = await collectionModel.getCollectionsByUser(idUser);

      return helper.response(response, 200, { message: 'get Collections by user Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get collections' }, error.message);
    }
  },
  getCollectionById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await collectionModel.getCollectionById(id);

      return helper.response(response, 200, { message: 'get Collection by id Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'failed to get Collection' }, error.message);
    }
  },
  postCollection: async (request, response) => {
    try {
      const setData = request.body;
      setData.id_user = request.token.result.id ? request.token.result.id : request.token.result.result.id;
      console.log(request.token.result.suspend);
      const { suspend } = request.token.result;

      if (suspend === 1) {
        return helper.response(response, 401, { message: 'Account has been suspended, please contact Admin' }, {});
      }
      setData.id = nanoid(16);
      setData.id_status = 1;

      const result = await collectionModel.postCollection(setData);

      return helper.response(response, 200, { message: 'post Collection Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to post collection' }, error.message);
    }
  },
  putCollection: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const result = await collectionModel.putCollection(id, setData);
      const resultForm = await collectionModel.getCollectionById(id);
      let htmlTemplate = '';
      if (setData.id_status === 3) {
        htmlTemplate = ` <center><h2><b>Permintaan Pengumpulan DITOLAK</b></h2><hr> </center>
   <span>Hi.. Mohon maaf, Pengajuan Pengumpulan minyak <b>DITOLAK</b> Karena Untuk saat ini <b>Alamat anda berada diluar jangkauan Kami </b></span><br><br><br>
   <span>Terimakasih, Teruslah menjadi bagian dari kami untuk menjadikan Bumi kita tetap terjaga</span><br><br>
   
    `;
        await helper.nodemailer(resultForm.email_user, 'Status Permintaan Pengumpulan Minyak', htmlTemplate);
      }

      return helper.response(response, 200, { message: 'put Collection Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to put collection' }, error.message);
    }
  },
  confirmCollection: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const responseData = await collectionModel.putCollection(id, setData);
      const result = await collectionModel.getCollectionById(responseData.id);
      console.log(result);
      const partner = await partnerModel.getPartnerById(request.body.id_mitra);
      const newTanggal = new Date(result.tanggal);
      const htmlTemplate = ` <center><h2><b>PERMINTAAN PENGUMPULAN DISETUJUI</b></h2><hr> </center>
      Nama : <span><b>${result.nama_user}</b></span><br><br>
      No Telp : <span>${result.no_telp}</span><br><br>
      Email : <span><b>${result.email_user}</b></span><br><br>
      Tanggal : <span>${newTanggal.getDate()} ${newTanggal.toLocaleString('default', { month: 'long' })} ${newTanggal.getFullYear()}</span><br><br>
      Waktu : <span><b>${result.waktu}</b></span><br><br>
      Pesan : <span>${result.pesan}</span><br><br>
      Alamat : <span><b>${result.alamat}</b></span><br><br>
      Total Minyak : <span><b>${result.total_minyak}</b></span><br><br>
      Kota : <span><b>${result.kota}</b></span><br><br>
      Status: <span><b>${result.status}</b></span><br><br>
      <br></br>

    `;

      await helper.nodemailer(partner.email, 'Permintaan Pengumpulan Minyak', htmlTemplate);
      await helper.nodemailer(result.email_user, 'Status Permintaan Pengumpulan Minyak', htmlTemplate);

      return helper.response(response, 200, { message: 'confirm Collection Successfully' }, responseData);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'failed to confirm collection' }, error.message);
    }
  },
};
