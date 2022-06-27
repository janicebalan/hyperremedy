import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/medicine.dart';
import '../view.dart';
import 'medicine_viewmodel.dart';

class AddInventoryReminderScreen extends StatelessWidget {
  AddInventoryReminderScreen({data, viewmodel})
      : _data = data,
        _viewmodel = viewmodel;
  String _data;
  MedicineViewmodel _viewmodel;

  String _selectedDate;
  void _onSave(context, _viewmodel, _data) {
    var _medicines = new Medicine(
        pillsLeft: _viewmodel.pillsLeft, pillsNotify: _viewmodel.pillsNotify);
    Navigator.pop(context, _medicines);
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              toolbarHeight: 70,
              title: Text(
                'Inventory Reminder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    children: <Widget>[
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Pills Left in Inventory',
                          ),
                          onChanged: (value) => _viewmodel.pillsLeft = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Remind when only',
                          ),
                          onChanged: (value) => _viewmodel.pillsNotify = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // _buildTextLisTile(
                      //   leading: null,
                      //   label: 'Remind when only',
                      //   onChanged: (value) => _viewmodel.pillsNotify = value,
                      // ),
                      SizedBox(height: 400.0),
                      _buildButtons(context, _viewmodel, _data)
                    ],
                  ),
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
      BuildContext context, MedicineViewmodel viewmodel, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Color.fromRGBO(82, 86, 232, 1),
            ),
          ),
          onPressed: () => Navigator.pop(context, null),
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: Color.fromRGBO(82, 86, 232, 1),
            ),
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(200, 200, 200, 1),
            ),
          ),
        ),
        const SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () => _onSave(context, viewmodel, data),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(82, 86, 232, 1),
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
