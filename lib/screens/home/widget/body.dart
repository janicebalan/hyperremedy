import 'package:flutter/material.dart';
import '../../blood_pressure/bloodpressure_screen.dart';
import '../../food/food_screen.dart';
import '../../medicine/medicine_screen.dart';
import '../../report/report_screen.dart';
import '../../symptoms/symptoms_screen.dart';
import '../add_voice_reminder_screen.dart';
import '/screens/user/user_viewmodel.dart';
import 'package:intl/intl.dart';

import '../../../models/user.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  Body({data}) : _data = data;
  String _data;

  UserViewmodel viewmodel = UserViewmodel();

  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 8),
            child: Column(
              children: [
                Text(
                  formattedDate,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
                  tooltip: 'Add Voice Reminder',
                  label: Text('Add Voice Reminder'),
                  icon: Icon(Icons.add),
                  heroTag: null,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddVoiceReminderScreen(
                                  data: _data,
                                )));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MedicineScreen.route(data: _data));
                          },
                          child: Container(
                            height: 160,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.health_and_safety,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                                const Divider(height: 10),
                                const Text(
                                  'Medicine',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto Stab',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(51, 51, 255, 0.7),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      4, 8), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, SymptomsScreen.route(data: _data));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cable,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const Divider(height: 10),
                                  const Text(
                                    'Symptoms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto Stab',
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(51, 51, 255, 0.7),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(1),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        4, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, FoodScreen.route(data: _data));
                          },
                          child: Container(
                            height: 170,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.fastfood,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                                const Divider(height: 10),
                                const Text(
                                  'Food Suggestions',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto Stab',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(51, 51, 255, 0.7),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      4, 8), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, ReportScreen.route(data: _data));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 170,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.analytics_outlined,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const Divider(height: 10),
                                  const Text(
                                    'Graph & Statistics',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto Stab',
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(51, 51, 255, 0.7),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(1),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        4, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context, BloodPressureScreen.route(data: _data));
                    },
                    child: Container(
                      height: 170,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.bloodtype_outlined,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          const Divider(height: 10),
                          const Text(
                            'Blood Pressure',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto Stab',
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(51, 51, 255, 0.7),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(4, 8), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
