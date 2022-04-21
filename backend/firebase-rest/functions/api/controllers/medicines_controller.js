'use strict';

const Controller = require('./controller');
const medicineModel = require('../models/medicine_model');

const medicinesController = new Controller(medicineModel);
module.exports = medicinesController.router;
