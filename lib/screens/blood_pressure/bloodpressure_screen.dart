import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../view.dart';
import 'bloodpressure_viewmodel.dart';
import 'widget/body.dart';
import 'widget/float.dart';

class BloodPressureScreen extends StatefulWidget {
  BloodPressureScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => BloodPressureScreen(data: data));
  String _data;

  @override
  _BloodPressureScreenState createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: BloodPressureViewmodel.overloadedContructorNamedArguemnts(
          widget._data),
      builder: (_context, _viewmodel, _child) => WillPopScope(
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
            body: widget._data != null
                ? Body(data: _viewmodel)
                : Body(data: widget._data),
            floatingActionButton: widget._data != null
                ? Float(data: _viewmodel, user: widget._data)
                : null,
          ),
        ),
      ),
    );
  }
}
