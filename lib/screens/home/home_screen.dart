import 'package:flutter/material.dart';

import '../../models/user.dart';
import 'widget/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => HomeScreen(data: data));
  User _data;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'HyperRemedy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
          ),
          body: Body(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety),
                tooltip: 'Medicine',
                label: 'Medicine',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                tooltip: 'Food',
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bloodtype),
                tooltip: 'Blood Pressure',
                label: 'Blood Pressure',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cable),
                tooltip: 'Symptoms',
                label: 'Symptoms',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                tooltip: 'Graph & Statistics',
                label: 'Graph & Statistics',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
