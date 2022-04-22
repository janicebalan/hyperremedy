import 'package:flutter/material.dart';
import '../../food/food_screen.dart';
import '/screens/user/user_viewmodel.dart';
import 'package:intl/intl.dart';

import '../../../models/user.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  Body({data}) : _data = data;
  User _data;

  UserViewmodel viewmodel = UserViewmodel();

  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: [
          Text(
            formattedDate,
            textAlign: TextAlign.left,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Text(
            _data != null ? 'Welcome ${_data.name}' : 'Welcome unknown!',
            textAlign: TextAlign.left,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
                            Navigator.pushNamed(context, "/medicine",
                                arguments: _data);
                          },
                          child: Container(
                            height: 130,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.health_and_safety,
                                  color: Colors.white,
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
                              color: const Color.fromRGBO(23, 102, 155, 1),
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
                            Navigator.pushNamed(context, "/symptoms",
                                arguments: _data);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 130,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cable,
                                    color: Colors.white,
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
                                color: const Color.fromRGBO(23, 102, 155, 1),
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
                            height: 130,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.fastfood,
                                  color: Colors.white,
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
                              color: const Color.fromRGBO(23, 102, 155, 1),
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
                            Navigator.pushNamed(context, "/report",
                                arguments: _data);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 130,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.analytics_outlined,
                                    color: Colors.white,
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
                                color: const Color.fromRGBO(23, 102, 155, 1),
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/bloodpressure",
                        arguments: _data);
                  },
                  child: Container(
                    height: 130,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.bloodtype_outlined,
                          color: Colors.white,
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
                      color: const Color.fromRGBO(23, 102, 155, 1),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
