'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class SymptomModel extends Model {
	constructor() {
		super('symptoms');
		if (this.instance) return this.instance;
		SymptomModel.instance = this;
	}
}

module.exports = new SymptomModel();
