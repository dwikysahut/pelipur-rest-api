const express = require('express');

const Route = express.Router();
const partnerController = require('../controllers/partner');
const { authentication, authorization } = require('../middleware/auth');

Route
  .get('/', authentication, partnerController.getAllPartners)
  .get('/:id', authentication, authorization, partnerController.getPartnerById)
  .post('/', authentication, authorization, partnerController.postPartner)
  .put('/:id', authentication, authorization, partnerController.putPartner)
  .delete('/:id', authentication, authorization, partnerController.deletePartner);

module.exports = Route;
