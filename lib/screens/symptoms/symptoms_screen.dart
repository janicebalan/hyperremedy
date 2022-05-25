import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/symptoms/symptoms_viewmodel.dart';
import '../../screens/symptoms/widget/body.dart';
import '../../models/user.dart';
import '../view.dart';
import 'widget/float.dart';

class SymptomsScreen extends StatefulWidget {
  SymptomsScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => SymptomsScreen(data: data));
  String _data;

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    // print("printing email id");
    // print(widget._data.id);
    // print("end printng");

    return View(
      viewmodel:
          SymptomsViewmodel.overloadedContructorNamedArguemnts(widget._data),
      builder: (_context, _viewmodel, _child) => WillPopScope(
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
