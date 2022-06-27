import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../view.dart';
import 'report_viewmodel.dart';
import 'widget/body.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => ReportScreen(data: data));
  String _data;

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel:
            ReportViewmodel.overloadedContructorNamedArguements(widget._data),
        builder: (_context, _viewmodel, _child) {
          //_viewmodel.sortByFilter(_viewmodel.bloodpressureListById);
          return WillPopScope(
            onWillPop: () => Future.value(true),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                appBar: AppBar(
                  title: const Text(
                    'Graph & Statistics',
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
              ),
            ),
          );
        });
  }
}
