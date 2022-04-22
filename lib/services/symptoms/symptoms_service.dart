import '../../models/symptom.dart';

abstract class SymptomsService {
  Future<List<Symptom>> getSymptomsById(dynamic id);
  Future<void> removeSymptoms(Symptom symptoms);
  Future<Symptom> addSymptoms(Symptom symptoms);
}
