import '../../app/dependencies.dart';
import '../../models/medicine.dart';
import '../rest.dart';
import 'medicine_service.dart';

class MedicineServiceRest implements MedicineService {
  RestService get rest => dependency();

  Future<List<Medicine>> getMedicinesById(dynamic id) async {
    final List listJson = await rest.get('medicines?userID=$id');
    return listJson.map((json) => Medicine.fromJson(json)).toList();
  }

  Future<void> removeMedicines(Medicine medicines) async {
    await rest.delete('medicines/${medicines.id}');
  }

  Future<Medicine> addMedicines(Medicine medicines) async {
    final json = await rest.post('medicines', data: medicines);
    return Medicine.fromJson(json);
  }

  Future<Medicine> updateMedicines(Medicine medicines) async {
    final json = await rest.put('medicines/${medicines.id}', data: medicines);
    return Medicine.fromJson(json);
  }
}
