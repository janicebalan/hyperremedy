import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../view.dart';
import 'medicine_viewmodel.dart';
import 'widget/body.dart';
import 'widget/float.dart';

class MedicineScreen extends StatefulWidget {
  MedicineScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => MedicineScreen(data: data));
  String _data;

  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel:
          MedicineViewmodel.overloadedContructorNamedArguemnts(widget._data),
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
