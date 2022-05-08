import 'package:flutter/material.dart';

import '../../view.dart';
import '../add_medicine_screen.dart';
import '../medicine_viewmodel.dart';

class Float extends StatelessWidget {
  Float({data, user})
      : _viewmodel = data,
        _data = user;

  String _data;
  MedicineViewmodel _viewmodel;

  void _onPlusPressed(
      BuildContext context, String data, MedicineViewmodel viewmodel) async {
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddMedicineScreen(data: data, viewmodel: viewmodel)));

    if (medicines != null) {
      viewmodel.addMedicines(medicines);
    } else {
      print("Null value");
    }
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _viewmodel,
      builder: (_context, _viewmodel, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              tooltip: 'Add a new medicine',
              label: Text('Add Medicines'),
              icon: Icon(Icons.add),
              heroTag: null,
              onPressed: () => _onPlusPressed(context, _data, _viewmodel),
            ),
          ],
        );
      },
    );
  }
}
