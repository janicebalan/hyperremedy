import 'package:flutter/material.dart';

import '../../models/user.dart';
import 'widget/body.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => FoodScreen(data: data));
  String _data;

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // var _index = 0;

  // get index => _index;
  // set index(value) => setState(() => _index = value);

  @override
  Widget build(BuildContext context) {
    // if (widget._data != null) {
    //   print(widget._data.email);
    // }
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text(
              'HyperRemedy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
