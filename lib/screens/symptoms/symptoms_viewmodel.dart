import '../../app/dependencies.dart';
import '../../models/symptom.dart';
import '../../services/symptoms/symptoms_service.dart';
import '../viewmodel.dart';

class SymptomsViewmodel extends Viewmodel {
  SymptomsService get _service => dependency();

  Symptom _symptom;
  String _type;
  String _date;
  String _description;
  String _userID;

  get symptom => _symptom;
  set symptom(value) => _symptom = value;

  get type => _type;
  set type(value) => _type = value;

  get date => _date;
  set date(value) {
    turnBusy();
    _date = value;
    turnIdle();
  }

  get description => _description;
  set description(value) => _description = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  List<Symptom> symptomListById;
  get symptomList => symptomListById;
  SymptomsViewmodel();
  SymptomsViewmodel.overloadedContructorNamedArguemnts(dynamic id) {
    //print(id);
    getSymptoms(id);
  }

  void getSymptoms(dynamic id) async {
    //print(id);
    turnBusy();
    symptomListById = await _service.getSymptomsById(id);
    // print(symptomListById);
    turnIdle();
  }

  void removeSymptom(Symptom symptoms, int index) async {
    turnBusy();
    //print(symptoms.id);
    await _service.removeSymptoms(symptoms);
    symptomListById.removeAt(index);
    turnIdle();
  }

  void addSymptoms(Symptom symptoms) async {
    turnBusy();
    final Symptom symptom = await _service.addSymptoms(symptoms);
    symptomListById.add(symptoms);
    turnIdle();
  }
}
