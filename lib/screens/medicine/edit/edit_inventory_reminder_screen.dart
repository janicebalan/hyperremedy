import 'package:flutter/material.dart';

import '../../../models/medicine.dart';
import '../../view.dart';
import '../medicine_viewmodel.dart';

class EditInventoryReminderScreen extends StatelessWidget {
  EditInventoryReminderScreen({index, viewmodel})
      : _index = index,
        _viewmodel = viewmodel;
  int _index;
  MedicineViewmodel _viewmodel;

  String _selectedDate;
  void _onSave(context, _viewmodel, _index) {
    var _medicines = new Medicine(
        pillsLeft: _viewmodel.medicinesListById[_index].pillsLeft,
        pillsNotify: _viewmodel.medicinesListById[_index].pillsNotify);
    Navigator.pop(context, _medicines);
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Inventory Reminder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromRGBO(64, 64, 64, 1),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    ListTile(
                      leading: null,
                      title: TextFormField(
                        initialValue:
                            _viewmodel.medicinesListById[_index].pillsLeft,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Pills Left in Inventory',
                        ),
                        onChanged: (value) => _viewmodel
                            .medicinesListById[_index].pillsLeft = value,
                        onTap: () {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ListTile(
                      leading: null,
                      title: TextFormField(
                        initialValue:
                            _viewmodel.medicinesListById[_index].pillsNotify,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Remind when only',
                        ),
                        onChanged: (value) => _viewmodel
                            .medicinesListById[_index].pillsNotify = value,
                        onTap: () {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    // _buildTextLisTile(
                    //   leading: null,
                    //   label: 'Remind when only',
                    //   onChanged: (value) => _viewmodel.pillsNotify = value,
                    // ),
                    SizedBox(height: 30.0),
                    _buildButtons(context, _viewmodel, _index)
                  ],
                ),
              ),
            ),
          );
        });
  }

  // ListTile _buildTextLisTile({leading, label, onChanged, onTap}) {
  //   return new ListTile(
  //     leading: leading,
  //     title: TextFormField(
  //       autofocus: false,
  //       decoration: InputDecoration(
  //         labelText: label,
  //       ),
  //       onChanged: onChanged,
  //       onTap: onTap,
  //     ),
  //   );
  // }

  Row _buildButtons(
      BuildContext context, MedicineViewmodel viewmodel, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(200, 200, 200, 1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () => _onSave(context, viewmodel, index),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(0, 102, 102, 1),
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
