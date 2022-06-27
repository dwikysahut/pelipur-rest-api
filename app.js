const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
// const https = require('https');
// const http = require('https');
// const fs = require('fs');
// const path = require('path');

const app = express();
const morgan = require('morgan');
const routeNavigator = require('./src/index');
require('dotenv').config();

const server = app.listen(process.env.PORT, process.env.NODE_ENV === 'production' ? process.env.HOST_DEPLOY : process.env.HOST_LOCAL, () => {
  const host = server.address().address;
  const { port } = server.address();

  console.log(`server start at ${host} : ${port}`);
});

// http.createServer(app).listen(3000, process.env.NODE_ENV === 'production' ?
//  process.env.HOST_DEPLOY : process.env.HOST_LOCAL, () => {
//   console.log(
//     `Example app listening on port ${process.env.PORT}! Go to https://localhost:${process.env.PORT}/`,
//   );
// });
// https
//   .createServer(
//     {
//       key: fs.readFileSync(path.resolve('ssl/server.key')),
//       cert: fs.readFileSync(path.resolve('ssl/server.cert')),
//     },
//     app,
//   )
//   .listen(process.env.PORT_HTTPS, process.env.NODE_ENV === 'production' ?
// process.env.HOST_DEPLOY : process.env.HOST_LOCAL, () => {
//     console.log(
//       `Example app listening on port ${process.env.PORT_HTTPS}! Go to https://localhost:${process.env.PORT_HTTPS}/`,
//     );
//   });
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/public', express.static(`${__dirname}/public`));
app.use(morgan('dev'));
app.use(
  cors({
    allowedHeaders: ['Content-Type', 'Authorization'],
    methods: ['GET', 'PUT', 'POST', 'DELETE'],
    credentials: 'true',
    optionSuccessStatus: 200,

  }),
);
app.use('/', routeNavigator);
module.exports = app;
