'use strict';

const Controller = require('./controller');
const bloodpressureModel = require('../models/bloodpressure_model');

const bloodpressuresController = new Controller(bloodpressureModel);
module.exports = bloodpressuresController.router;
