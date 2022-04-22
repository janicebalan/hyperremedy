import '../../app/dependencies.dart';
import '../../models/symptom.dart';
import '../rest.dart';
import 'symptoms_service.dart';

class SymptomsServiceRest implements SymptomsService {
  RestService get rest => dependency();

  Future<List<Symptom>> getSymptomsById(dynamic id) async {
    // print('print id in service');
    // print(id);
    final List listJson = await rest.get('symptoms?userID=$id');
    // print('print json in service');
    // print(listJson);
    return listJson.map((json) => Symptom.fromJson(json)).toList();
  }

  Future<Symptom> addSymptoms(Symptom symptoms) async {
    final json = await rest.post('symptoms', data: symptoms);
    return Symptom.fromJson(json);
  }

  Future<void> removeSymptoms(Symptom symptoms) async {
    await rest.delete('symptoms/${symptoms.id}');
  }
}
