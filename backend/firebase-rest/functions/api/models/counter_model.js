'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class CounterModel extends Model {
	constructor() {
		super('counters');
		if (this.instance) return this.instance;
		CounterModel.instance = this;
	}
}

module.exports = new CounterModel();
