import '../../app/dependencies.dart';
import '../../models/symptom.dart';
import '../../services/symptoms/symptoms_service.dart';
import '../viewmodel.dart';

class SymptomsViewmodel extends Viewmodel {
  SymptomsService get _service => dependency();

  Symptom _symptom;

  get symptom => _symptom;
  set symptom(value) => _symptom = value;

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
    turnIdle();
  }

  void removeSymptom(Symptom symptoms, int index) async {
    turnBusy();
    //print(symptoms.id);
    await _service.removeSymptoms(symptoms);
    symptomListById.removeAt(index);
    turnIdle();
  }
}
