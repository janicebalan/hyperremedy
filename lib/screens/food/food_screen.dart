import 'package:flutter/material.dart';

import '../../models/user.dart';
import 'widget/body.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => FoodScreen(data: data));
  User _data;

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
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
        ),
      ),
    );
  }
}
