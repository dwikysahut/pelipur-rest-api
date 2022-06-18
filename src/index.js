const express = require('express');

const Route = express.Router();

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');
const collectionRoutes = require('./routes/collection');
const partnerRoutes = require('./routes/partner');
const cityRoutes = require('./routes/city');
const descRoutes = require('./routes/description');
const dataRoutes = require('./routes/data');
const newsRoutes = require('./routes/news');

Route.use('/auth', authRoutes);
Route.use('/users', userRoutes);
Route.use('/collections', collectionRoutes);
Route.use('/partners', partnerRoutes);
Route.use('/cities', cityRoutes);
Route.use('/descriptions', descRoutes);
Route.use('/datas', dataRoutes);
Route.use('/news', newsRoutes);
module.exports = Route;
