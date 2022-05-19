const express = require('express');

const Route = express.Router();

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');

Route.use('/auth', authRoutes);
Route.use('/users', userRoutes);

module.exports = Route;
