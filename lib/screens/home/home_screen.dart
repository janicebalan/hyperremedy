import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/user/user_viewmodel.dart';

import '../../models/user.dart';
import 'widget/body.dart';

class HomeScreen extends StatelessWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => HomeScreen(user: user));

  HomeScreen({user}) : _viewmodel = user;
  User _viewmodel;

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
                  Navigator.pushNamed(context, "/login");
                },
              )
            ],
            backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
          ),
          body: Body(data: _viewmodel),
        ),
      ),
    );
  }
}
