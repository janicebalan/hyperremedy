import 'package:flutter/material.dart';

import '../../view.dart';
import '../add_bloodpressure_screen.dart';
import '../bloodpressure_viewmodel.dart';

class Float extends StatelessWidget {
  Float({data, user})
      : _viewmodel = data,
        _data = user;

  String _data;
  BloodPressureViewmodel _viewmodel;

  void _onPlusPressed(BuildContext context, String data,
      BloodPressureViewmodel viewmodel) async {
    final bloodpressures = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddBloodPressureScreen(data: data, viewmodel: viewmodel)));

    if (bloodpressures != null) {
      viewmodel.addBloodPressures(bloodpressures);
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
              tooltip: 'Add a new readings',
              label: Text('Add Readings'),
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
