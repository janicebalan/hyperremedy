import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/symptoms/symptoms_viewmodel.dart';

import '../../view.dart';
import '../add_symptoms_screen.dart';

class Float extends StatelessWidget {
  Float({data, user})
      : _viewmodel = data,
        _data = user;

  String _data;
  SymptomsViewmodel _viewmodel;

  void _onPlusPressed(
      BuildContext context, String data, SymptomsViewmodel viewmodel) async {
    final symptoms = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddSymptomsScreen(data: data, viewmodel: viewmodel)));

    if (symptoms != null) {
      viewmodel.addSymptoms(symptoms);
    } else {
      print("Null value");
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(_data);
    return View(
      viewmodel: _viewmodel,
      builder: (_context, _viewmodel, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
              tooltip: 'Add a new symptom',
              label: Text('Add Symptoms'),
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
