const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const morgan = require('morgan');
const routeNavigator = require('./src/index');
require('dotenv').config();

const server = app.listen(process.env.PORT, process.env.NODE_ENV === 'production' ? process.env.HOST_DEPLOY : process.env.HOST_LOCAL, () => {
  const host = server.address().address;
  const { port } = server.address();

  console.log(`server start at ${host} : ${port}`);
});

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
