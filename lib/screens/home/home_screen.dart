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
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
              )
            ],
            backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
