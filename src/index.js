const express = require('express');

const Route = express.Router();

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');
const collectionRoutes = require('./routes/collection');
const partnerRoutes = require('./routes/partner');

Route.use('/auth', authRoutes);
Route.use('/users', userRoutes);
Route.use('/collections', collectionRoutes);
Route.use('/partners', partnerRoutes);

module.exports = Route;
