import 'package:flutter/material.dart';
import '../../screens/symptoms/widget/body.dart';
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
    // if (widget._data != null) {
    //   print("printing email id");
    //   print(widget._data.id);
    //   print("end printng");
    // }
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(216, 212, 212, 1),
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
          body: widget._data != null
              ? Body(data: widget._data.id)
              : Body(data: widget._data),
        ),
      ),
    );
  }
}
