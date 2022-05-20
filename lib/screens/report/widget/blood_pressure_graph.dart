// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../../report/widget/graph_day.dart';
import '../../report/widget/graph_overall.dart';
import '../../report/widget/graph_year.dart';
import '../../blood_pressure/bloodpressure_viewmodel.dart';
import '../../view.dart';
import 'graph_month.dart';

class BloodPressureGraph extends StatelessWidget {
  BloodPressureGraph({data}) : _viewmodel = data;
  final BloodPressureViewmodel _viewmodel;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<Color> gradientColors1 = [
    const Color(0x6d6027),
    const Color(0xD3CBB8),
  ];
  List<Color> gradientColors2 = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: DropdownButton(
                  value: _viewmodel.filterValue,
                  items: [
                    DropdownMenuItem(
                      child: Text("Last 7 days"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Last 30 days"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Year"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Overall"),
                      value: 4,
                    ),
                  ],
                  onChanged: (value) {
                    _viewmodel.filterValue = value;
                  },
                ),
              ),
              _viewmodel.filterValue == 1
                  ? GraphDay(data: _viewmodel)
                  : _viewmodel.filterValue == 2
                      ? GraphMonth(data: _viewmodel)
                      : _viewmodel.filterValue == 3
                          ? GraphYear(data: _viewmodel)
                          : GraphOverall(data: _viewmodel),
            ],
          );
        });
  }
}
