'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class ReminderModel extends Model {
	constructor() {
		super('reminders');
		if (this.instance) return this.instance;
		ReminderModel.instance = this;
	}
}

module.exports = new ReminderModel();
