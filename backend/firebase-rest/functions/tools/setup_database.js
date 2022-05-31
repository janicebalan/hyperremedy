// Script:  setup_database.js
// Purpose: An helper tool to upload stock data to firestore

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
			foodDetails: 'Has lower calories and fat content as compared to its fatty red counterparts'
		},
		{
			id: 'food2',
			range: 'high',
			photoUrl:
				'https://www.eatthis.com/wp-content/uploads/sites/4/2021/11/shutterstock_175231781.jpg?quality=82&strip=all',
			foodName: 'Yogurt',
			foodDetails: 'Calcium rich foods can lower blood pressure'
		},
		{
			id: 'food3',
			range: 'high',
			photoUrl: 'https://rasamalaysia.com/wp-content/uploads/2020/05/boneless-chicken-breasts-thumb-480x480.jpg',
			foodName: 'Skinless turkey and chicken',
			foodDetails: ''
		},
		{
			id: 'food4',
			range: 'high',
			photoUrl:
				'https://www.unlockfood.ca/EatRightOntario/media/Website-images-resized/How-to-store-fruit-to-keep-it-fresh-resized.jpg',
			foodName: 'Fruits',
			foodDetails: 'Fresh, frozen, or canned without added salt'
		},
		{
			id: 'food5',
			range: 'high',
			photoUrl:
				'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
			foodName: 'Vegetables',
			foodDetails: 'Fresh, frozen, or canned without added salt'
		},
		{
			id: 'food6',
			range: 'high',
			photoUrl:
				'https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png',
			foodName: 'Use less oil, butter margarine',
			foodDetails: ''
		},
		{
			id: 'food7',
			range: 'high',
			photoUrl:
				'https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png',
			foodName: 'Eat foods with lower in fat and calories',
			foodDetails: ''
		},
		{
			id: 'food8',
			range: 'high',
			photoUrl:
				'https://www.foodnavigator.com/var/wrbm_gb_food_pharma/storage/images/5/7/9/9/1159975-1-eng-GB/Study-identifies-quick-and-simple-test-for-salt-levels-in-food.jpg',
			foodName: 'Eat foods with less salt',
			foodDetails: 'Use spices and herbs, vinegar, lemon or fruit juices instead of salt to flavor foods'
		},

		{
			id: 'food9',
			range: 'normal',
			photoUrl: 'https://img.freepik.com/free-vector/healthy-food-pyramid-chart_1308-47113.jpg?w=2000',
			foodName: 'Eating a balanced diet',
			foodDetails: 'For more information, go to https://www.healthdirect.gov.au/balanced-diet '
		},

		{
			id: 'food10',
			range: 'low',
			photoUrl: 'https://www.jessicagavin.com/wp-content/uploads/2020/09/how-to-fry-an-egg-3-1200.jpg',
			foodName: 'Eggs',
			foodDetails:
				'Egg yolk significantly increased blood pressure. This helps improve both your cholesterol and your blood pressure while keeping you satisfied'
		},
		{
			id: 'food11',
			range: 'low',
			photoUrl:
				'https://i.guim.co.uk/img/media/eda873838f940582d1210dcf51900efad3fa8c9b/0_469_7360_4417/master/7360.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=4136d0378a9d158831c65d13dcc16389',
			foodName: 'Water',
			foodDetails: 'Water increase blood volume and help prevent dehydration'
		},
		{
			id: 'food12',
			range: 'low',
			photoUrl: 'https://thebrownidentity.com/wp-content/uploads/2020/07/Food-ingredients-first.jpeg',
			foodName: 'Foods high in vitamin b12',
			foodDetails: 'Eggs, meat, milk products'
		},
		{
			id: 'food13',
			range: 'low',
			photoUrl: 'https://betterme.world/articles/wp-content/uploads/2021/06/shutterstock_390988792.jpg',
			foodName: 'Food high in folate ',
			foodDetails: 'Dark leafy green vegetable, fruits, nuts, beans, eggs, dairy, meat, poultry, seafood, grains'
		},
		{
			id: 'food14',
			range: 'low',
			photoUrl: 'https://www.eatthis.com/wp-content/uploads/sites/4/2020/10/junk-food.jpg?quality=82&strip=1',
			foodName: 'Salty foods',
			foodDetails: 'Salt helps prevent a drop in blood pressure'
		}
	],
	symptoms: [
		{
			id: 'symptoms1',
			type: 'Cough',
			date: '2022-10-24',
			description: 'Feeling extremely pain in the chest',
			userID: 'user1'
		},
		{
			id: 'symptoms2',
			type: 'Fever',
			date: '2022-10-24',
			description: 'Shivering with high fever',
			userID: 'user1'
		}
	],
	bloodpressures: [
		{
			id: 'bp1',
			diastolic: 89,
			systolic: 59,
			pulse: 70,
			date: '2022-10-01',
			range: 'Low',
			userID: 'user1'
		},
		{
			id: 'bp2',
			diastolic: 119,
			systolic: 79,
			pulse: 70,
			date: '2021-04-10',
			range: 'Normal',
			userID: 'user1'
		},
		{
			id: 'bp3',
			diastolic: 125,
			systolic: 79,
			pulse: 70,
			date: '2022-02-17',
			range: 'Elevated (high)',
			userID: 'user1'
		},
		{
			id: 'bp4',
			diastolic: 134,
			systolic: 83,
			pulse: 70,
			date: '2022-06-09',
			range: 'Stage 1 (high)',
			userID: 'user1'
		},
		{
			id: 'bp5',
			diastolic: 143,
			systolic: 100,
			pulse: 70,
			date: '2022-12-29',
			range: 'Stage 2 (high)',
			userID: 'user1'
		},
		{
			id: 'bp6',
			diastolic: 180,
			systolic: 120,
			pulse: 70,
			date: '2020-01-01',
			range: 'Hypertensive Crisis (high)',
			userID: 'user1'
		}
	],
	medicines: [
		{
			id: 'med1',
			medicineName: 'Blood pressure medicine',
			freqIntake: 'Once a day',
			totalPills: 20.0,
			pillsLeft: 10.0,
			pillsNotify: 5.0,
			userID: 'user1',
			dose: 2.0,
			date: '2022-10-24'
		},
		{
			id: 'med2',
			medicineName: 'Cough medicine',
			freqIntake: 'Once a day',
			totalPills: 20.0,
			pillsLeft: 10.0,
			pillsNotify: 5.0,
			userID: 'user1',
			dose: 2.0,
			date: '2022-10-24'
		},
		{
			id: 'med3',
			medicineName: 'Blood medicine',
			freqIntake: 'Once a day',
			totalPills: 20.0,
			pillsLeft: 0.0,
			pillsNotify: 5.0,
			userID: 'user1',
			dose: 2.0,
			date: '2022-10-24'
		}
	],
	reminders: [
		{
			id: 'rem1',
			hour: 15,
			minute: 25,
			medsId: 'med1'
		},
		{
			id: 'rem2',
			hour: 03,
			minute: 10,
			medsId: 'med1'
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
