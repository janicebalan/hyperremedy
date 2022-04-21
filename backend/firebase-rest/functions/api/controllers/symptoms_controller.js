'use strict';

const Controller = require('./controller');
const symptomsModel = require('../models/symptom_model');

const symptomssController = new Controller(symptomsModel);
module.exports = symptomssController.router;
