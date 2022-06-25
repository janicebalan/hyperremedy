import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app/dependencies.dart';
import '../../models/medicine.dart';
import '../rest.dart';
import 'medicine_service.dart';

class MedicineServiceRest implements MedicineService {
  RestService get rest => dependency();
  CollectionReference updateMedsId =
      FirebaseFirestore.instance.collection('medicines');

  Future<List<Medicine>> getMedicinesById(dynamic id) async {
    final List listJson = await rest.get('medicines?userID=$id');
    return listJson.map((json) => Medicine.fromJson(json)).toList();
  }

  Future<Medicine> getMedicinesReminder(dynamic id) async {
    print("Reminder medicine id in service");
    print(id);
    final List json = await rest.get('medicines?id=$id');
    print(json);
    if (json.length == null) {
      print("no value");
      return null;
    } else {
      print(json[0]);
      return Medicine.fromJson(json[0]);
    }
  }

  Future<void> removeMedicines(Medicine medicines) async {
    await rest.delete('medicines/${medicines.id}');
  }

  Future<Medicine> addMedicines(Medicine medicines) async {
    final json = await rest.post('medicines', data: medicines);
    print("json med id");
    print(json['id']);
    _updateMedicineId(json['id']);
    return Medicine.fromJson(json);
  }

  void _updateMedicineId(uid) async {
    print("inside store");
    await updateMedsId
        .doc(uid)
        .update({
          'id': uid,
        })
        .then((value) => print("medicine updated"))
        .catchError((error) => print("Failed to updatre medicine: $error"));
  }

  Future<Medicine> updateMedicines(Medicine medicines) async {
    final json = await rest.put('medicines/${medicines.id}', data: medicines);
    return Medicine.fromJson(json);
  }
}
