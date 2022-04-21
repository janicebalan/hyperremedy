'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class UserModel extends Model {
	constructor() {
		super('users');
		if (this.instance) return this.instance;
		UserModel.instance = this;
	}
}

module.exports = new UserModel();
