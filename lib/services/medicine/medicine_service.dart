import '../../models/medicine.dart';

abstract class MedicineService {
  Future<List<Medicine>> getMedicinesById(dynamic id);
  Future<void> removeMedicines(Medicine medicines);
  Future<Medicine> addMedicines(Medicine medicines);
  Future<Medicine> updateMedicines(Medicine medicines);
}
