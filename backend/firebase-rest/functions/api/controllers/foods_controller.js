'use strict';

const Controller = require('./controller');
const foodModel = require('../models/food_model');

const foodsController = new Controller(foodModel);
module.exports = foodsController.router;
