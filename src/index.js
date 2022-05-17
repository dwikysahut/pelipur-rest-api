const express = require('express');

const Route = express.Router();

const authRoutes = require('./routes/auth');

Route.use('/auth', authRoutes);

module.exports = Route;
