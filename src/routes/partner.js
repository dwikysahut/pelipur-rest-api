const express = require('express');

const Route = express.Router();
const partnerController = require('../controllers/partner');
const { authentication, authorization } = require('../middleware/auth');
const imageUpload = require('../middleware/imageUpload');

Route
  .get('/', partnerController.getAllPartners)
  .get('/:id', authentication, authorization, partnerController.getPartnerById)
  .get('/:id/cities', authentication, authorization, partnerController.getPartnersByCity)
  .post('/', authentication, authorization, imageUpload, partnerController.postPartner)
  .put('/:id', authentication, authorization, imageUpload, partnerController.putPartner)
  .delete('/:id', authentication, authorization, partnerController.deletePartner);

module.exports = Route;
