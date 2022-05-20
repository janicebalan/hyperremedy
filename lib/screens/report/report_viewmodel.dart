import 'package:fl_chart/fl_chart.dart';

import '../../app/dependencies.dart';
import '../../models/bloodpressure.dart';
import '../../services/bloodpressure/bloodpressure_service.dart';
import '../viewmodel.dart';

class ReportViewmodel extends Viewmodel {
  BloodPressureService get _service => dependency();
  int _filterValue = 1;

  List<BloodPressure> bloodpressureListById;
  get bloodpressureList => bloodpressureListById;
  ReportViewmodel();
  ReportViewmodel.overloadedContructorNamedArguements(dynamic id) {
    getBloodPressuresReport(id);
  }

  void getBloodPressuresReport(dynamic id) async {
    turnBusy();
    bloodpressureListById = await _service.getBloodPressuresById(id);
    sortByFilter(bloodpressureListById);
    turnIdle();
  }

  get filterValue => _filterValue;
  set filterValue(value) {
    turnBusy();
    _filterValue = value;
    turnIdle();
  }

  List<BloodPressure> bpByWeek = [];
  get bpWeek => bpByWeek;

  List<BloodPressure> bpByMonth = [];
  get bpMonth => bpByMonth;

  List<BloodPressure> bpByYear = [];
  get bpYear => bpByYear;

  List<FlSpot> systolic_arrWeek = [];
  get systolicWeek => systolic_arrWeek;
  List<FlSpot> diastolic_arrWeek = [];
  get diastolicWeek => diastolic_arrWeek;
  List<FlSpot> pulse_arrWeek = [];
  get pulseWeek => pulse_arrWeek;

  List<FlSpot> systolic_arrMonth = [];
  get systolicMonth => systolic_arrMonth;
  List<FlSpot> diastolic_arrMonth = [];
  get diastolicMonth => diastolic_arrMonth;
  List<FlSpot> pulse_arrMonth = [];
  get pulseMonth => pulse_arrMonth;

  List<FlSpot> systolic_arrYear = [];
  get systolicYear => systolic_arrYear;
  List<FlSpot> diastolic_arrYear = [];
  get diastolicYear => diastolic_arrYear;
  List<FlSpot> pulse_arrYear = [];
  get pulseYear => pulse_arrYear;

  List<FlSpot> systolic_arrAll = [];
  get systolicAll => systolic_arrAll;
  List<FlSpot> diastolic_arrAll = [];
  get diastolicAll => diastolic_arrAll;
  List<FlSpot> pulse_arrAll = [];
  get pulseAll => pulse_arrAll;

  void sortByFilter(List<BloodPressure> bpList) {
    for (int i = 0; i < bpList.length; i++) {
      systolic_arrAll.add(FlSpot((i * 1.0), bpList[i].systolic.toDouble()));
    }
    for (int i = 0; i < bpList.length; i++) {
      diastolic_arrAll.add(FlSpot((i * 1.0), bpList[i].diastolic.toDouble()));
    }
    for (int i = 0; i < bpList.length; i++) {
      pulse_arrAll.add(FlSpot((i * 1.0), bpList[i].pulse.toDouble()));
    }

    var now_1w = DateTime.now().subtract(Duration(days: 7));
    var now_1m = new DateTime(
        DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
    var now_1y = new DateTime(
        DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);

    //sort by 7 days
    for (int i = 0; i < bpList.length; i++) {
      if (now_1w.isBefore(DateTime.parse(bpList[i].date))) {
        bpByWeek.add(bpList[i]);
      }
    }
    for (int i = 0; i < bpByWeek.length; i++) {
      systolic_arrWeek.add(FlSpot((i * 1.0), bpByWeek[i].systolic.toDouble()));
    }
    for (int i = 0; i < bpByWeek.length; i++) {
      diastolic_arrWeek
          .add(FlSpot((i * 1.0), bpByWeek[i].diastolic.toDouble()));
    }
    for (int i = 0; i < bpByWeek.length; i++) {
      pulse_arrWeek.add(FlSpot((i * 1.0), bpByWeek[i].pulse.toDouble()));
    }

    //sort by 1 month
    for (int i = 0; i < bpList.length; i++) {
      if (now_1m.isBefore(DateTime.parse(bpList[i].date))) {
        bpByMonth.add(bpList[i]);
      }
    }
    for (int i = 0; i < bpByMonth.length; i++) {
      systolic_arrMonth
          .add(FlSpot((i * 1.0), bpByMonth[i].systolic.toDouble()));
    }
    for (int i = 0; i < bpByMonth.length; i++) {
      diastolic_arrMonth
          .add(FlSpot((i * 1.0), bpByMonth[i].diastolic.toDouble()));
    }
    for (int i = 0; i < bpByMonth.length; i++) {
      pulse_arrMonth.add(FlSpot((i * 1.0), bpByMonth[i].pulse.toDouble()));
    }

    //sort by 1 year
    for (int i = 0; i < bpList.length; i++) {
      if (now_1y.isBefore(DateTime.parse(bpList[i].date))) {
        bpByYear.add(bpList[i]);
      }
    }
    for (int i = 0; i < bpByYear.length; i++) {
      systolic_arrYear.add(FlSpot((i * 1.0), bpByYear[i].systolic.toDouble()));
    }
    for (int i = 0; i < bpByYear.length; i++) {
      diastolic_arrYear
          .add(FlSpot((i * 1.0), bpByYear[i].diastolic.toDouble()));
    }
    for (int i = 0; i < bpByYear.length; i++) {
      pulse_arrYear.add(FlSpot((i * 1.0), bpByYear[i].pulse.toDouble()));
    }
  }
}
