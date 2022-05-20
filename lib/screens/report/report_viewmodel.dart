import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../../app/dependencies.dart';
import '../../models/bloodpressure.dart';
import '../../models/symptom.dart';
import '../../services/bloodpressure/bloodpressure_service.dart';
import '../../services/symptoms/symptoms_service.dart';
import '../viewmodel.dart';

class ReportViewmodel extends Viewmodel {
  BloodPressureService get _service => dependency();
  SymptomsService get _service1 => dependency();

  int _filterValue = 1;
  double _symp0 = 0.0;
  double _symp1 = 0.0;
  double _symp2 = 0.0;
  double _symp3 = 0.0;
  double _symp4 = 0.0;
  double _symp5 = 0.0;
  double _symp6 = 0.0;
  double _symp7 = 0.0;
  double _symp8 = 0.0;
  double _symp9 = 0.0;
  double _symp10 = 0.0;
  double _maxSymp = 0.0;

  List<BloodPressure> bloodpressureListById;
  get bloodpressureList => bloodpressureListById;

  List<Symptom> symptomListById;
  get symptomList => symptomListById;

  ReportViewmodel();
  ReportViewmodel.overloadedContructorNamedArguements(dynamic id) {
    getBloodPressuresReport(id);
    getSymptomsReport(id);
  }

  void getBloodPressuresReport(dynamic id) async {
    turnBusy();
    bloodpressureListById = await _service.getBloodPressuresById(id);
    sortByFilter(bloodpressureListById);
    turnIdle();
  }

  void getSymptomsReport(dynamic id) async {
    turnBusy();
    symptomListById = await _service1.getSymptomsById(id);
    countSymptoms(symptomListById);
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

  get symp0 => _symp0;
  set symp0(value) => _symp0 = value;
  get symp1 => _symp1;
  set symp1(value) => _symp1 = value;
  get symp2 => _symp2;
  set symp2(value) => _symp2 = value;
  get symp3 => _symp3;
  set symp3(value) => _symp3 = value;
  get symp4 => _symp4;
  set symp4(value) => _symp4 = value;
  get symp5 => _symp5;
  set symp5(value) => _symp5 = value;
  get symp6 => _symp6;
  set symp6(value) => _symp6 = value;
  get symp7 => _symp7;
  set symp7(value) => _symp7 = value;
  get symp8 => _symp8;
  set symp8(value) => _symp8 = value;
  get symp9 => _symp9;
  set symp9(value) => _symp9 = value;
  get symp10 => _symp10;
  set symp10(value) => _symp10 = value;
  get maxSymp => _maxSymp;
  set maxSymp(value) => _maxSymp = value;

  void countSymptoms(List<Symptom> sympList) {
    for (int i = 0; i < sympList.length; i++) {
      if (sympList[i].type == 'Body pain') {
        _symp0++;
      } else if (sympList[i].type == 'Cramps') {
        _symp1++;
      } else if (sympList[i].type == 'Coughs') {
        _symp2++;
      } else if (sympList[i].type == 'Fatigue') {
        _symp3++;
      } else if (sympList[i].type == 'Headaches') {
        _symp4++;
      } else if (sympList[i].type == 'Allergies') {
        _symp5++;
      } else if (sympList[i].type == 'Memory loss') {
        _symp6++;
      } else if (sympList[i].type == 'Cough') {
        _symp7++;
      } else if (sympList[i].type == 'Fever') {
        _symp8++;
      } else if (sympList[i].type == 'Sore throat') {
        _symp9++;
      } else if (sympList[i].type == 'Others') {
        _symp10++;
      }
    }
    _maxSymp = [
      _symp0,
      _symp1,
      _symp2,
      _symp3,
      _symp4,
      _symp5,
      _symp6,
      _symp7,
      _symp8,
      _symp9,
      _symp10
    ].reduce(max);
  }
}
