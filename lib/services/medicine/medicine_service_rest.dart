import '../../app/dependencies.dart';
import '../../models/medicine.dart';
import '../rest.dart';
import 'medicine_service.dart';

class MedicineServiceRest implements MedicineService {
  RestService get rest => dependency();

  Future<List<Medicine>> getMedicinesById(dynamic id) async {
    // print('print id in service');
    // print(id);
    final List listJson = await rest.get('medicines?userID=$id');
    // print('print json in service');
    // print(listJson);
    return listJson.map((json) => Medicine.fromJson(json)).toList();
  }

  Future<void> removeMedicines(Medicine medicines) async {
    await rest.delete('medicines/${medicines.id}');
  }
  // Future<BloodPressure> addBloodPressures(BloodPressure bloodpressures) async {
  //   final json = await rest.post('bloodpressures', data: bloodpressures);
  //   return BloodPressure.fromJson(json);
  // }

}
