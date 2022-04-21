'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class FoodModel extends Model {
	constructor() {
		super('foods');
		if (this.instance) return this.instance;
		FoodModel.instance = this;
	}
}

module.exports = new FoodModel();
