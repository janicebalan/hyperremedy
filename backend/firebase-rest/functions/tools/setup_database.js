// Script:  setup_database.js
// Purpose: An helper tool to upload stock data to firestore
//
// Author: Jumail
// Email: jumail@utm.my
// Github:  github.com/jumail-utm
// Update: 4 Jun 2021

// Add collections and their documents to the database
// Setup the data first manually
// To use your own name for the document, specify the id
// property (The id must be of type string).  Otherwise,
// the document name will be auto-generated

const _collectionsJson = {
	users: [
		{
			id: 'user1',
			name: 'Alexander Holmes',
			phoneNo: '017-7519305',
			yearBorn: '1958',
			password: '123',
			email: 'alex@gmail.com'
		},
		{
			id: 'user2',
			name: 'Jessica Walters',
			phoneNo: '017-3046587',
			yearBorn: '1960',
			password: 'password',
			email: 'jessica@gmail.com'
		}
	],
	foods: [
		{
			id: 'food1',
			range: 'high',
			photoUrl:
				'https://res.cloudinary.com/grohealth/image/upload/f_auto,fl_lossy,q_auto/v1583748085/DCUK/Content/Cod-Trout-Fillet-Vegetable-Prepared-Fish_Medium.jpg',
			foodName: 'Lean Meat',
			foodDetails:
				'Lean meat is a broad category used to define white meat, poultry or fish that has lower calories and fat content as compared to its fatty red counterparts'
		},
		{
			id: 'food2',
			range: 'normal',
			photoUrl: 'https://fooddoodles.com/wp-content/uploads/2021/01/broccoli-1200.jpg',
			foodName: 'Broccoli',
			foodDetails:
				'Broccoli provides good amount of phytonutrients. Phytonutrients are compounds that reduce the risk of developing heart disease, diabetes, and some cancers.'
		},
		{
			id: 'food3',
			range: 'low',
			photoUrl: 'https://www.jessicagavin.com/wp-content/uploads/2020/09/how-to-fry-an-egg-3-1200.jpg',
			foodName: 'Eggs',
			foodDetails:
				'Egg yolk significantly increased blood pressure. This helps improve both your cholesterol and your blood pressure while keeping you satisfied'
		}
	],
	symptoms: [
		{
			id: 'symptoms1',
			type: 'Cough',
			date: '19-18-2022',
			description: 'Feeling extremely pain in the chest',
			userID: 'user1'
		},
		{
			id: 'symptoms2',
			type: 'Cough',
			date: '19-18-2022',
			description: 'Feeling extremely pain in the chest',
			userID: 'user1'
		}
	],
	bloodpressures: [
		{
			id: 'bp1',
			diastolic: 140,
			systolic: 80,
			pulse: 90,
			date: '19-18-2022',
			range: 'High',
			userID: 'user1'
		},
		{
			id: 'bp2',
			diastolic: 150,
			systolic: 80,
			pulse: 90,
			date: '19-18-2022',
			range: 'Low',
			userID: 'user1'
		}
	],
	medicines: [
		{
			id: 'bp1',
			diastolic: 140,
			systolic: 80,
			pulse: 90,
			date: '19-18-2022',
			range: 'High',
			userID: 'user1'
		},
		{
			id: 'bp2',
			diastolic: 150,
			systolic: 80,
			pulse: 90,
			date: '19-18-2022',
			range: 'Low',
			userID: 'user1'
		}
	]
};

const _firestore = require('../api/models/firebase/firebase_admin').firestore();

async function setupDatabase(_req, res, _next) {
	// Start adding the data to the database
	for (const collectionName in _collectionsJson) {
		const collectionData = _collectionsJson[collectionName];

		for (const documentData of collectionData) {
			if (documentData && documentData.id) {
				const documentId = documentData.id;

				// id will not be included in the database. it is used only to name the document
				delete documentData.id;

				const result = await _firestore.collection(collectionName).doc(documentId).set(documentData);
				console.log({ documentId, result });
			} else {
				await _firestore.collection(collectionName).add(documentData);
				console.log('auto gen doc id');
			}
		}
	}

	res.send('Setting Up Database.... Done ');
}

module.exports = setupDatabase;
