'use strict';

const Controller = require('./controller');
const counterModel = require('../models/counter_model');

const countersController = new Controller(counterModel);
module.exports = countersController.router;
