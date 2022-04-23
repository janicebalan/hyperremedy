import '../../app/dependencies.dart';
import '../../models/medicine.dart';
import '../../services/medicine/medicine_service.dart';
import '../viewmodel.dart';

class MedicineViewmodel extends Viewmodel {
  MedicineService get _service => dependency();

  Medicine _medicine;
  // int _diastolic;
  // int _systolic;
  // int _pulse;
  // String _date;
  // String _range;
  // String _userID;
  String _medicineName;
  String _freqIntake;
  int _totalPills;
  String _datetime;
  int _pillsLeft;
  String _pillsNotify;
  String _medsNotify;
  String _userID;
  String _duration;
  int _dose;

  get medicine => _medicine;
  set medicine(value) => _medicine = value;

  get medicineName => _medicineName;
  set medicineName(value) => _medicineName = value;

  get freqIntake => _freqIntake;
  set freqIntake(value) => _freqIntake = value;

  get totalPills => _totalPills;
  set totalPills(value) => _totalPills = value;

  get datetime => _datetime;
  set datetime(value) => _datetime = value;

  get pillsLeft => _pillsLeft;
  set pillsLeft(value) => _pillsLeft = value;

  get pillsNotify => _pillsNotify;
  set pillsNotify(value) => _pillsNotify = value;

  get medsNotify => _medsNotify;
  set medsNotify(value) => _medsNotify = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  get duration => _duration;
  set duration(value) => _duration = value;

  get dose => _dose;
  set dose(value) => _dose = value;

  // get systolic => _systolic;
  // set systolic(value) => _systolic = value;

  // get pulse => _pulse;
  // set pulse(value) => _pulse = value;

  // get date => _date;
  // set date(value) {
  //   turnBusy();
  //   _date = value;
  //   turnIdle();
  // }

  // get range => _range;
  // set range(value) => _range = value;

  // get userID => _userID;
  // set userID(value) => _userID = value;

  List<Medicine> medicinesListById;
  get medicinesList => medicinesListById;
  MedicineViewmodel();
  MedicineViewmodel.overloadedContructorNamedArguemnts(dynamic id) {
    //print(id);
    getMedicines(id);
  }

  void getMedicines(dynamic id) async {
    //print(id);
    turnBusy();
    medicinesListById = await _service.getMedicinesById(id);
    // print(symptomListById);
    turnIdle();
  }

  void removeBloodPressure(Medicine medicines, int index) async {
    turnBusy();
    //print(symptoms.id);
    await _service.removeMedicines(medicines);
    medicinesListById.removeAt(index);
    turnIdle();
  }

  // void addBloodPressures(BloodPressure bloodpressures) async {
  //   turnBusy();
  //   final BloodPressure symptom =
  //       await _service.addBloodPressures(bloodpressures);
  //   bloodpressureListById.add(bloodpressures);
  //   turnIdle();
  // }
}
