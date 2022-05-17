// const nodeMailer = require('nodemailer');

module.exports = {
  response: (response, status, data, { message }) => {
    const result = {};
    result.status = status || 200;
    result.message = message;
    result.data = data;

    return response.status(result.status).json(result);
  },
};
