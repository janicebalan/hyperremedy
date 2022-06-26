import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../report_viewmodel.dart';

class GraphDay extends StatelessWidget {
  GraphDay({data}) : _viewmodel = data;
  final ReportViewmodel _viewmodel;
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

  final _cardGradient = const LinearGradient(
    colors: [
      Colors.greenAccent,
      Colors.green,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  final _highGradient = const LinearGradient(
    colors: [
      Colors.redAccent,
      Colors.red,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  final _lowGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.blue,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return Column(
            children: [
              Text(
                'Last 7 Days',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Container(
                height: 60,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Average',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        Text(
                          'Diastolic:${_viewmodel.avgDiaWeek.toStringAsFixed(2)}  Systolic:${_viewmodel.avgSysWeek.toStringAsFixed(2)}  Pulse:${_viewmodel.avgPulWeek.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: _cardGradient,
                  //color: const Color.fromRGBO(23, 102, 155, 1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),

                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const Divider(height: 10),
              Container(
                height: 60,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Highest',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        Text(
                          'Diastolic:${_viewmodel.maxDiaWeek}  Systolic:${_viewmodel.maxSysWeek}  Pulse:${_viewmodel.maxPulWeek}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: _highGradient,
                  //color: const Color.fromRGBO(23, 102, 155, 1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const Divider(height: 10),
              Container(
                height: 60,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Lowest',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        Text(
                          'Diastolic:${_viewmodel.minDiaWeek}  Systolic:${_viewmodel.minSysWeek}  Pulse:${_viewmodel.minPulWeek}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: _lowGradient,
                  //color: const Color.fromRGBO(23, 102, 155, 1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const Divider(height: 10),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Column(
                      children: [
                        Text(
                          'Diatolic',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      children: [
                        Text(
                          'Systolic',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.green),
                    child: Column(
                      children: [
                        Text(
                          'Pulse',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xff232d37)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                          mainData(_viewmodel),
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;

    switch (value.toInt()) {
      case 1:
        text = const Text("");
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10';
        break;
      case 50:
        text = '50';
        break;
      case 100:
        text = '100';
        break;
      case 150:
        text = '150';
        break;
      case 200:
        text = '200';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(ReportViewmodel viewmodel) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text(
            'Timeline',
            style:
                new TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          ),
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: Text(
            'Dia/Sys/Pulse',
            style:
                new TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      // minX: 0,
      // maxX: 11,
      minY: 0,
      maxY: 200,
      lineBarsData: [
        LineChartBarData(
          spots: viewmodel.systolic_arrWeek,
          isCurved: true,
          color: Colors.red,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        LineChartBarData(
          spots: viewmodel.diastolic_arrWeek,
          isCurved: true,
          color: Colors.blue,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        LineChartBarData(
          spots: viewmodel.pulse_arrWeek,
          isCurved: true,
          color: Colors.green,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
