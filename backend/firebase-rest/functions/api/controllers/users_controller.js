'use strict';

const Controller = require('./controller');
const userModel = require('../models/user_model');

const usersController = new Controller(userModel);
module.exports = usersController.router;
