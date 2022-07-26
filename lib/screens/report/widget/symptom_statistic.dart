import 'package:flutter/material.dart';
import '../../view.dart';
import '../report_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';

class SymptomStatistic extends StatelessWidget {
  SymptomStatistic({data}) : _viewmodel = data;
  final ReportViewmodel _viewmodel;

  static const pilateColor = Color(0xff632af2);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xff578eff);
  static const betweenSpace = 1.0;

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: DropdownButton(
                      value: _viewmodel.filterValueSymp,
                      items: [
                        const DropdownMenuItem(
                          child: Text("Last 7 days"),
                          value: 1,
                        ),
                        const DropdownMenuItem(
                          child: Text("Last 30 days"),
                          value: 2,
                        ),
                        const DropdownMenuItem(
                          child: Text("Year"),
                          value: 3,
                        ),
                        const DropdownMenuItem(
                          child: Text("Overall"),
                          value: 4,
                        ),
                      ],
                      onChanged: (value) {
                        _viewmodel.filterValueSymp = value;
                      },
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: Container(
                      color: const Color(0xff2c4260),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 40, bottom: 12),
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(
                                axisNameWidget: Text(
                                  'Amount',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                axisNameWidget: Text(
                                  'Symptoms',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 100,
                                ),
                              ),
                            ),
                            barTouchData: BarTouchData(
                              enabled: false,
                              touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.transparent,
                                  tooltipPadding: const EdgeInsets.all(0)),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            barGroups: [
                              BarChartGroupData(
                                x: 0,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp0Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp0Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp0Year
                                                : _viewmodel.symp0,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 1,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp1Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp1Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp1Year
                                                : _viewmodel.symp1,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 2,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp2Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp2Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp2Year
                                                : _viewmodel.symp2,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 3,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp3Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp3Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp3Year
                                                : _viewmodel.symp3,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 4,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp4Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp4Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp4Year
                                                : _viewmodel.symp4,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 5,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp5Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp5Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp5Year
                                                : _viewmodel.symp5,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 6,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp6Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp6Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp6Year
                                                : _viewmodel.symp6,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 7,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp7Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp7Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp7Year
                                                : _viewmodel.symp7,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 8,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp8Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp8Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp8Year
                                                : _viewmodel.symp8,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 9,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp9Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp9Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp9Year
                                                : _viewmodel.symp9,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 10,
                                barRods: [
                                  BarChartRodData(
                                    toY: (_viewmodel.filterValueSymp) == 1
                                        ? _viewmodel.symp10Week
                                        : (_viewmodel.filterValueSymp) == 2
                                            ? _viewmodel.symp10Month
                                            : (_viewmodel.filterValueSymp) == 3
                                                ? _viewmodel.symp10Year
                                                : _viewmodel.symp10,
                                    gradient: _barsGradient,
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                            ],
                            maxY: (_viewmodel.filterValueSymp) == 1
                                ? _viewmodel.maxSympWeek + (betweenSpace * 3)
                                : (_viewmodel.filterValueSymp) == 2
                                    ? _viewmodel.maxSympMonth +
                                        (betweenSpace * 3)
                                    : (_viewmodel.filterValueSymp) == 3
                                        ? _viewmodel.maxSympYear +
                                            (betweenSpace * 3)
                                        : _viewmodel.maxSymp +
                                            (betweenSpace * 3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Body Pain';
        break;
      case 1:
        text = 'Cramps';
        break;
      case 2:
        text = 'Coughs';
        break;
      case 3:
        text = 'Fatigue';
        break;
      case 4:
        text = 'Headaches';
        break;
      case 5:
        text = 'Allergies';
        break;
      case 6:
        text = 'Memory Loss';
        break;
      case 7:
        text = 'Cough';
        break;
      case 8:
        text = 'Fever';
        break;
      case 9:
        text = 'Sore throat';
        break;
      case 10:
        text = 'Others';
        break;
      default:
        text = '';
        break;
    }
    return Center(
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
