import 'package:flutter/material.dart';
import '../../models/user.dart';

class BloodPressureScreen extends StatefulWidget {
  BloodPressureScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => BloodPressureScreen(data: data));
  User _data;

  @override
  _BloodPressureScreenState createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'blood pressure',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
          ),
        ),
      ),
    );
  }
}
