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
  int _filterValueSymp = 1;
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

  double _symp0Week = 0.0;
  double _symp1Week = 0.0;
  double _symp2Week = 0.0;
  double _symp3Week = 0.0;
  double _symp4Week = 0.0;
  double _symp5Week = 0.0;
  double _symp6Week = 0.0;
  double _symp7Week = 0.0;
  double _symp8Week = 0.0;
  double _symp9Week = 0.0;
  double _symp10Week = 0.0;
  double _maxSympWeek = 0.0;

  double _symp0Month = 0.0;
  double _symp1Month = 0.0;
  double _symp2Month = 0.0;
  double _symp3Month = 0.0;
  double _symp4Month = 0.0;
  double _symp5Month = 0.0;
  double _symp6Month = 0.0;
  double _symp7Month = 0.0;
  double _symp8Month = 0.0;
  double _symp9Month = 0.0;
  double _symp10Month = 0.0;
  double _maxSympMonth = 0.0;

  double _symp0Year = 0.0;
  double _symp1Year = 0.0;
  double _symp2Year = 0.0;
  double _symp3Year = 0.0;
  double _symp4Year = 0.0;
  double _symp5Year = 0.0;
  double _symp6Year = 0.0;
  double _symp7Year = 0.0;
  double _symp8Year = 0.0;
  double _symp9Year = 0.0;
  double _symp10Year = 0.0;
  double _maxSympYear = 0.0;

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

  get filterValueSymp => _filterValueSymp;
  set filterValueSymp(value) {
    turnBusy();
    _filterValueSymp = value;
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

  var now_1w = DateTime.now().subtract(Duration(days: 7));
  var now_1m = new DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
  var now_1y = new DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);

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

  get symp0Week => _symp0Week;
  set symp0Week(value) => _symp0Week = value;
  get symp1Week => _symp1Week;
  set symp1Week(value) => _symp1Week = value;
  get symp2Week => _symp2Week;
  set symp2Week(value) => _symp2Week = value;
  get symp3Week => _symp3Week;
  set symp3Week(value) => _symp3Week = value;
  get symp4Week => _symp4Week;
  set symp4Week(value) => _symp4Week = value;
  get symp5Week => _symp5Week;
  set symp5Week(value) => _symp5Week = value;
  get symp6Week => _symp6Week;
  set symp6Week(value) => _symp6Week = value;
  get symp7Week => _symp7Week;
  set symp7Week(value) => _symp7Week = value;
  get symp8Week => _symp8Week;
  set symp8Week(value) => _symp8Week = value;
  get symp9Week => _symp9Week;
  set symp9Week(value) => _symp9Week = value;
  get symp10Week => _symp10Week;
  set symp10Week(value) => _symp10Week = value;
  get maxSympWeek => _maxSympWeek;
  set maxSympWeek(value) => _maxSympWeek = value;

  get symp0Month => _symp0Month;
  set symp0Month(value) => _symp0Month = value;
  get symp1Month => _symp1Month;
  set symp1Month(value) => _symp1Month = value;
  get symp2Month => _symp2;
  set symp2Month(value) => _symp2Month = value;
  get symp3Month => _symp3Month;
  set symp3Month(value) => _symp3Month = value;
  get symp4Month => _symp4Month;
  set symp4Month(value) => _symp4Month = value;
  get symp5Month => _symp5Month;
  set symp5Month(value) => _symp5Month = value;
  get symp6Month => _symp6Month;
  set symp6Month(value) => _symp6Month = value;
  get symp7Month => _symp7Month;
  set symp7Month(value) => _symp7Month = value;
  get symp8Month => _symp8Month;
  set symp8Month(value) => _symp8Month = value;
  get symp9Month => _symp9Month;
  set symp9Month(value) => _symp9Month = value;
  get symp10Month => _symp10Month;
  set symp10Month(value) => _symp10Month = value;
  get maxSympMonth => _maxSympMonth;
  set maxSympMonth(value) => _maxSympMonth = value;

  get symp0Year => _symp0Year;
  set symp0Year(value) => _symp0Year = value;
  get symp1Year => _symp1Year;
  set symp1Year(value) => _symp1Year = value;
  get symp2Year => _symp2Year;
  set symp2Year(value) => _symp2Year = value;
  get symp3Year => _symp3Year;
  set symp3Year(value) => _symp3Year = value;
  get symp4Year => _symp4Year;
  set symp4Year(value) => _symp4Year = value;
  get symp5Year => _symp5Year;
  set symp5Year(value) => _symp5Year = value;
  get symp6Year => _symp6Year;
  set symp6Year(value) => _symp6Year = value;
  get symp7Year => _symp7Year;
  set symp7Year(value) => _symp7Year = value;
  get symp8Year => _symp8Year;
  set symp8Year(value) => _symp8Year = value;
  get symp9Year => _symp9Year;
  set symp9Year(value) => _symp9Year = value;
  get symp10Year => _symp10Year;
  set symp10Year(value) => _symp10Year = value;
  get maxSympYear => _maxSympYear;
  set maxSympYear(value) => _maxSympYear = value;

  void countSymptoms(List<Symptom> sympList) {
    for (int i = 0; i < sympList.length; i++) {
      if (sympList[i].type == 'Body pain') {
        _symp0++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp0Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp0Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp0Year++;
        }
      } else if (sympList[i].type == 'Cramps') {
        _symp1++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp1Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp1Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp1Year++;
        }
      } else if (sympList[i].type == 'Coughs') {
        _symp2++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp2Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp2Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp2Year++;
        }
      } else if (sympList[i].type == 'Fatigue') {
        _symp3++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp3Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp3Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp3Year++;
        }
      } else if (sympList[i].type == 'Headaches') {
        _symp4++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp4Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp4Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp4Year++;
        }
      } else if (sympList[i].type == 'Allergies') {
        _symp5++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp5Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp5Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp5Year++;
        }
      } else if (sympList[i].type == 'Memory loss') {
        _symp6++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp6Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp6Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp6Year++;
        }
      } else if (sympList[i].type == 'Cough') {
        _symp7++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp7Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp7Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp7Year++;
        }
      } else if (sympList[i].type == 'Fever') {
        _symp8++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp8Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp8Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp8Year++;
        }
      } else if (sympList[i].type == 'Sore throat') {
        _symp9++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp9Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp9Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp9Year++;
        }
      } else if (sympList[i].type == 'Others') {
        _symp10++;
        if (now_1w.isBefore(DateTime.parse(sympList[i].date))) {
          _symp10Week++;
        } else if (now_1m.isBefore(DateTime.parse(sympList[i].date))) {
          _symp10Month++;
        } else if (now_1y.isBefore(DateTime.parse(sympList[i].date))) {
          _symp10Year++;
        }
      }
    }
    _maxSympWeek = [
      _symp0Week,
      _symp1Week,
      _symp2Week,
      _symp3Week,
      _symp4Week,
      _symp5Week,
      _symp6Week,
      _symp7Week,
      _symp8Week,
      _symp9Week,
      _symp10Week
    ].reduce(max);

    _maxSympMonth = [
      _symp0Month,
      _symp1Month,
      _symp2Month,
      _symp3Month,
      _symp4Month,
      _symp5Month,
      _symp6Month,
      _symp7Month,
      _symp8Month,
      _symp9Month,
      _symp10Month
    ].reduce(max);

    _maxSympYear = [
      _symp0Year,
      _symp1Year,
      _symp2Year,
      _symp3Year,
      _symp4Year,
      _symp5Year,
      _symp6Year,
      _symp7Year,
      _symp8Year,
      _symp9Year,
      _symp10Year
    ].reduce(max);

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
