import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../view.dart';
import 'report_viewmodel.dart';
import 'widget/body.dart';

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
    return View(
        viewmodel: ReportViewmodel.overloadedContructorNamedArguements(
            widget._data.id),
        builder: (_context, _viewmodel, _child) {
          //_viewmodel.sortByFilter(_viewmodel.bloodpressureListById);
          return WillPopScope(
            onWillPop: () => Future.value(true),
            child: SafeArea(
              child: Scaffold(
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
                  backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
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
