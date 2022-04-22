import '../../app/dependencies.dart';
import '../../models/bloodpressure.dart';
import '../../services/bloodpressure/bloodpressure_service.dart';
import '../viewmodel.dart';

class BloodPressureViewmodel extends Viewmodel {
  BloodPressureService get _service => dependency();

  BloodPressure _bloodpressure;
  int _diastolic;
  int _systolic;
  int _pulse;
  String _date;
  String _range;
  String _userID;

  get bloodpressure => _bloodpressure;
  set bloodpressure(value) => _bloodpressure = value;

  get diastolic => _diastolic;
  set diastolic(value) => _diastolic = value;

  get systolic => _systolic;
  set systolic(value) => _systolic = value;

  get pulse => _pulse;
  set pulse(value) => _pulse = value;

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
    final BloodPressure symptom =
        await _service.addBloodPressures(bloodpressures);
    bloodpressureListById.add(bloodpressures);
    turnIdle();
  }
}
