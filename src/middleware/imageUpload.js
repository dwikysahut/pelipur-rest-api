/* eslint-disable no-unused-expressions */
/* eslint-disable no-sequences */
const multer = require('multer');
const path = require('path');

const checkFileType = (file, cb) => {
  const filetypes = /jpeg|jpg|png|gif/;
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  const mimeType = filetypes.test(file.mimetype);
  if (extname && mimeType) {
    return cb(null, true);
  }
  console.log(file);
  return cb('Upload Image only', false);
};

const storage = multer.diskStorage({
  destination(req, file, cb) {
    cb(null, './public/image'),
    file;
  },
  filename(req, file, cb) {
    const fileExt = file.originalname.split('.')[1];
    cb(null, `${file.fieldname}-${Date.now()}.${fileExt}`);
  },
});
const upload = multer({
  storage,
  limits: { fileSize: 100000024 },
  fileFilter(req, file, cb) {
    checkFileType(file, cb);
  },
});

module.exports = upload.single('image');
