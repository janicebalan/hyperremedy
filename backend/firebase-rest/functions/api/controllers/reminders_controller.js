'use strict';

const Controller = require('./controller');
const reminderModel = require('../models/reminder_model');

const remindersController = new Controller(reminderModel);
module.exports = remindersController.router;
