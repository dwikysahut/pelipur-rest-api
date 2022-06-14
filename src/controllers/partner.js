const partnerModel = require('../models/partner');
const collectionModel = require('../models/collection');
const helper = require('../helpers');

module.exports = {
  getAllPartners: async (request, response) => {
    try {
      const result = await partnerModel.getAllPartners();

      return helper.response(response, 200, { message: 'Get All Partners Successfully' }, result);
    } catch (error) {
      return helper.response(response, 500, { message: 'Failed to get all partners' });
    }
  },
  getPartnerById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await partnerModel.getPartnerById(id);
      // const newResult = JSON.parse(result.kota_jangkauan);
      // const array = newResult.map((kota) => parseInt(kota));
      // console.log(array);
      return helper.response(response, 200, { message: 'Get Partner Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to get partner' });
    }
  },
  getPartnersByCity: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await collectionModel.getCollectionById(id);
      const resultPartner = await partnerModel.getPartnerByCity(result.kota);
      console.log(result);
      return helper.response(response, 200, { message: 'Get Partner by City Successfully' }, resultPartner);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to get partner by city' });
    }
  },
  postPartner: async (request, response) => {
    try {
      const setData = request.body;
      setData.image = request.file.filename;
      const result = await partnerModel.postPartner(setData);

      return helper.response(response, 200, { message: 'Add Partner Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to add partner' });
    }
  },
  putPartner: async (request, response) => {
    try {
      const { id } = request.params;
      const setData = request.body;
      const partner = await partnerModel.getPartnerById(id);
      if (request.file) {
        if (request.file.filename === 'undefined') {
          console.log('gambar undefined');
        } else {
          setData.image = request.file.filename;
          await partnerModel.deletePartnerImage(partner.image);
        }
      }

      const result = await partnerModel.putPartner(id, setData);
      return helper.response(response, 200, { message: 'Edit Partner Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to edit partner' });
    }
  },
  deletePartner: async (request, response) => {
    try {
      const { id } = request.params;
      const partner = await partnerModel.getPartnerById(id);

      const result = await partnerModel.deletePartner(id);
      if (result) {
        await partnerModel.deletePartnerImage(partner.image);
      }
      return helper.response(response, 200, { message: 'Delete Partner Successfully' }, result);
    } catch (error) {
      console.log(error);
      return helper.response(response, 500, { message: 'Failed to delete partner' });
    }
  },
};
