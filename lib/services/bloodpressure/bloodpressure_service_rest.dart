import '../../app/dependencies.dart';
import '../../models/bloodpressure.dart';
import '../rest.dart';
import 'bloodpressure_service.dart';

class BloodPressureServiceRest implements BloodPressureService {
  RestService get rest => dependency();

  Future<List<BloodPressure>> getBloodPressuresById(dynamic id) async {
    // print('print id in service');
    // print(id);
    final List listJson = await rest.get('bloodpressures?userID=$id');
    // print('print json in service');
    // print(listJson);
    return listJson.map((json) => BloodPressure.fromJson(json)).toList();
  }

  Future<BloodPressure> addBloodPressures(BloodPressure bloodpressures) async {
    final json = await rest.post('bloodpressures', data: bloodpressures);
    return BloodPressure.fromJson(json);
  }

  Future<void> removeBloodPressures(BloodPressure bloodpressures) async {
    await rest.delete('bloodpressures/${bloodpressures.id}');
  }
}
