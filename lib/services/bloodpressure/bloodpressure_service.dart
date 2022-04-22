import '../../models/bloodpressure.dart';

abstract class BloodPressureService {
  Future<List<BloodPressure>> getBloodPressuresById(dynamic id);
  Future<void> removeBloodPressures(BloodPressure bloodpressures);
  Future<BloodPressure> addBloodPressures(BloodPressure bloodpressures);
}
