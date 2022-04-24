import '../../app/dependencies.dart';
import '../../models/bloodpressure.dart';
import '../../services/bloodpressure/bloodpressure_service.dart';
import '../viewmodel.dart';

class BloodPressureViewmodel extends Viewmodel {
  BloodPressureService get _service => dependency();

  BloodPressure _bloodpressure;
  int _diastolic = 80;
  int _systolic = 120;
  int _pulse = 60;
  String _date;
  String _range;
  String _userID;

  get bloodpressure => _bloodpressure;
  set bloodpressure(value) => _bloodpressure = value;

  // get diastolic => _diastolic;
  // set diastolic(value) => _diastolic = value;

  // get systolic => _systolic;
  // set systolic(value) => _systolic = value;

  // get pulse => _pulse;
  // set pulse(value) => _pulse = value;

  get diastolic => _diastolic;
  set diastolic(value) {
    turnBusy();
    _diastolic = value;
    turnIdle();
  }

  get systolic => _systolic;
  set systolic(value) {
    turnBusy();
    _systolic = value;
    turnIdle();
  }

  get pulse => _pulse;
  set pulse(value) {
    turnBusy();
    _pulse = value;
    turnIdle();
  }

  get date => _date;
  set date(value) {
    turnBusy();
    _date = value;
    turnIdle();
  }

  get range => _range;
  set range(value) => _range = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  List<BloodPressure> bloodpressureListById;
  get bloodpressureList => bloodpressureListById;
  BloodPressureViewmodel();
  BloodPressureViewmodel.overloadedContructorNamedArguemnts(dynamic id) {
    //print(id);
    getBloodPressures(id);
  }

  void getBloodPressures(dynamic id) async {
    //print(id);
    turnBusy();
    bloodpressureListById = await _service.getBloodPressuresById(id);
    // print(symptomListById);
    turnIdle();
  }

  void removeBloodPressure(BloodPressure bloodpressures, int index) async {
    turnBusy();
    //print(symptoms.id);
    await _service.removeBloodPressures(bloodpressures);
    bloodpressureListById.removeAt(index);
    turnIdle();
  }

  void addBloodPressures(BloodPressure bloodpressures) async {
    turnBusy();
    bloodpressures.range = checkRange(bloodpressures);
    final BloodPressure symptom =
        await _service.addBloodPressures(bloodpressures);
    bloodpressureListById.add(bloodpressures);
    turnIdle();
  }

  String checkRange(BloodPressure bloodpressures) {
    int sys = bloodpressures.systolic;
    int dia = bloodpressures.diastolic;
    // int pulse = bloodpressures.pulse;
    String level = bloodpressures.range;

    if ((sys < 90) && (dia < 60)) {
      level = "Low";
    } else if (sys < 120 && dia < 80) {
      level = "Normal";
    } else if ((sys >= 120 && sys <= 129) && (dia < 80)) {
      level = "Elevated (high)";
    } else if ((sys >= 130 && sys <= 139) && (dia >= 80 && dia <= 89)) {
      level = "Stage 1 (high)";
    } else if ((sys >= 140 && sys < 180) && (dia >= 90 && dia < 120)) {
      level = "Stage 2 (high)";
    } else {
      level = "Hypertensive Crisis (high)";
    }
    return level;
  }
}
