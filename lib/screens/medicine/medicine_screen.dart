import 'package:flutter/material.dart';
import '../../models/user.dart';

class MedicineScreen extends StatefulWidget {
  MedicineScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => MedicineScreen(data: data));
  User _data;

  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'medicine',
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
