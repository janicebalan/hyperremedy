import '../../models/medicine.dart';

abstract class MedicineService {
  Future<List<Medicine>> getMedicinesById(dynamic id);
  Future<void> removeMedicines(Medicine medicines);
  //Future<BloodPressure> addBloodPressures(BloodPressure bloodpressures);
}
