/* eslint-disable consistent-return */
/* eslint-disable no-shadow */
const fs = require('fs');

module.exports = {
  deleteFile(items) {
    if (items.length > 0) {
      items.forEach((item) => {
        fs.stat(`./public/image/${item.image}`, (err, stats) => {
          console.log(stats);

          if (err) {
            return console.error(err);
          }

          fs.unlink(`./public/image/${item.image}`, (err) => {
            if (err) return console.log(err);
            console.log('file deleted successfully');
          });
        });
      });
    }
  },
};
