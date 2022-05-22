'use strict';
const functions = require('firebase-functions');
const express = require('express');
const app = express();
const usersRouter = require('./api/controllers/users_controller');
const countersRouter = require('./api/controllers/counters_controller');
const foodsRouter = require('./api/controllers/foods_controller');
const bloodpressuresRouter = require('./api/controllers/bloodpressures_controller');
const medicinesRouter = require('./api/controllers/medicines_controller');
const symptomsRouter = require('./api/controllers/symptoms_controller');
const { authsRouter, verifyAccessToken } = require('./api/controllers/auths_controller');

app.use(express.json());

//app.use('/users', usersRouter);
app.use('/counters', countersRouter);
app.use('/foods', foodsRouter);
app.use('/bloodpressures', bloodpressuresRouter);
app.use('/medicines', medicinesRouter);
app.use('/symptoms', symptomsRouter);
app.use('/auths', authsRouter);
app.use('/users', verifyAccessToken, usersRouter);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
	timeoutSeconds: 300
});

exports.setupdb = functions.https.onRequest(require('./tools/setup_database'));
exports.setupauth = functions.https.onRequest(require('./tools/setup_authentications'));
exports.api = functions.https.onRequest(app);
