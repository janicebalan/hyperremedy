'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class MedicineModel extends Model {
	constructor() {
		super('medicines');
		if (this.instance) return this.instance;
		MedicineModel.instance = this;
	}
}

module.exports = new MedicineModel();
