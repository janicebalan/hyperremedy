// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/report/widget/blood_pressure_graph.dart';
import '../../view.dart';
import 'package:intl/intl.dart';

import '../report_viewmodel.dart';
import 'symptom_statistic.dart';

class Body extends StatelessWidget {
  Body({data}) : _viewmodel = data;
  final ReportViewmodel _viewmodel;

  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _viewmodel,
      builder: (_context, _viewmodel, _child) => Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Colors.blue,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'BloodPressure'),
                                  Tab(text: 'Symptoms'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height -
                                150, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              BloodPressureGraph(data: _viewmodel),
                              SymptomStatistic(data: _viewmodel),
                            ]))
                      ])),
            ],
          )),
    );
  }
}
