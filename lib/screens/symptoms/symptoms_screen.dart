import 'package:flutter/material.dart';
import '../../models/user.dart';

class SymptomsScreen extends StatefulWidget {
  SymptomsScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => SymptomsScreen(data: data));
  User _data;

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'symptoms',
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
