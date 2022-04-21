'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class BloodPressureModel extends Model {
	constructor() {
		super('bloodpressures');
		if (this.instance) return this.instance;
		BloodPressureModel.instance = this;
	}
}

module.exports = new BloodPressureModel();
