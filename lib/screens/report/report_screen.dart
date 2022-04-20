import 'package:flutter/material.dart';
import '../../models/user.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => ReportScreen(data: data));
  User _data;

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'report',
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
