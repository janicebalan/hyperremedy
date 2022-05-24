const schedule = require('node-schedule');
var FCM = require('fcm-node');
var serverKey =
	'AAAACGsmkDw:APA91bEOOWFCxxMAROFxrozjXNAzMR_-fptjLterdyBMo7vGcKsUaXhrqByLb7shNtLbX5D76Q4eXtdQiz3HARuhgmj0RBgwiiW8_0fb077o6lhT2WIZGR1grOFjvSxHY1k_J_6FnimW';
var fcm = new FCM(serverKey);

var message = {
	to:
		'AIwUaOkajTgVuHjI4_lYKF1dZ585FVzmQtDMreZOm27N5BmIEd_XfgHKC-ZTr0zmpO78cUrxDoMOK7zjEfdRXQSVBfHcxuSnxZackBulZSziHRyOGMy6CjtB_dcMIGgjnhSzWWZM6x5Vf9yEzHjIjFsjEVGPpuvn8FV89TnXvqNVDd87fbPiN5LFYOopnSVGmXTT-l8VO-MIT2JjwwBn0mo7lEzh3eNobQ',
	notification: {
		title: 'NotifcatioTestAPP',
		body: '{"Message from node js app"}'
	},

	data: {
		//you can send only notification or only data(or include both)
		title: 'ok cdfsdsdfsd',
		body: '{"name" : "okg ooggle ogrlrl","product_id" : "123","final_price" : "0.00035"}'
	}
};

fcm.send(message, function(err, response) {
	if (err) {
		console.log('Something has gone wrong!' + err);
		console.log('Respponse:! ' + response);
	} else {
		// showToast("Successfully sent with response");
		console.log('Successfully sent with response: ', response);
	}
});
// At particular date and time
// var t = new Date();
// t.setSeconds(t.getSeconds() + 10);
// schedule.scheduleJob(t, () => {
// 	console.log('Job ran at ', new Date().toString());
// });

//* at recurrent intervals

// schedule.scheduleJob('m-job', '*/2 * * * * *', () => {
// 	console.log('I ran');
// 	schedule.cancelJob('m-job');
// });

const mJob = schedule.scheduleJob('*/2 * * * * *', () => {
	console.log('I ran');

	mJob.cancel();
});
