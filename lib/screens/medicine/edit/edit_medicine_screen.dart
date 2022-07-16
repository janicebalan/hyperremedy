import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/medicine.dart';
import '../../view.dart';
import '../medicine_viewmodel.dart';
import 'edit_inventory_reminder_screen.dart';

class EditMedicineScreen extends StatelessWidget {
  EditMedicineScreen({index, viewmodel})
      : _index = index,
        _viewmodel = viewmodel;
  int _index;
  MedicineViewmodel _viewmodel;

  String _selectedDate;
  void _onSave(context, _viewmodel, _index) {
    var _medicines = new Medicine(
      id: _viewmodel.medicinesListById[_index].id,
      medicineName: _viewmodel.medicinesListById[_index].medicineName,
      freqIntake: _viewmodel.medicinesListById[_index].freqIntake,
      totalPills: _viewmodel.medicinesListById[_index].totalPills,
      pillsLeft: _viewmodel.medicinesListById[_index].pillsLeft,
      pillsNotify: _viewmodel.medicinesListById[_index].pillsNotify,
      userID: _viewmodel.medicinesListById[_index].userID,
      dose: _viewmodel.medicinesListById[_index].dose,
      date: _viewmodel.medicinesListById[_index].date,
    );
    Navigator.pop(context, _medicines);
  }

  // void _onReminderMedicinePressed(
  //     BuildContext context, String data, MedicineViewmodel viewmodel) async {
  //   final medicines = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               AddMedicineReminderScreen(data: data, viewmodel: viewmodel)));

  //   if (medicines != null) {
  //     medicines.dose = _viewmodel.dose;
  //   } else {
  //     print("Null value");
  //   }
  // }

  void _onReminderInventoryPressed(
      BuildContext context, int index, MedicineViewmodel viewmodel) async {
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditInventoryReminderScreen(
                index: index, viewmodel: viewmodel)));

    if (medicines != null) {
      medicines.pillsLeft = _viewmodel.medicinesListById[index].pillsLeft;
      medicines.pillsNotify = _viewmodel.medicinesListById[index].pillsNotify;
    } else {
      print("Null value");
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Once a day"), value: "Once a day"),
      DropdownMenuItem(child: Text("Twice a day"), value: "Twice a day"),
      DropdownMenuItem(child: Text("Every x hours"), value: "Every x hours"),
      DropdownMenuItem(child: Text("Thrice a day"), value: "Thrice a day"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    print("hello1");
    print(_viewmodel.medicinesListById[_index].medicineName);
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          print(_viewmodel.medicinesListById[_index].medicineName);
          return new Scaffold(
            appBar: new AppBar(
              toolbarHeight: 70,
              title: Text(
                'Edit Medicine',
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
                      _buildTextLisTile(
                        leading: null,
                        label: 'Medicine Name',
                        value:
                            _viewmodel.medicinesListById[_index].medicineName,
                        onChanged: (value) => _viewmodel
                            .medicinesListById[_index].medicineName = value,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Frequency of Intake'),
                            DropdownButtonFormField(
                              value: _viewmodel
                                  .medicinesListById[_index].freqIntake,
                              items: dropdownItems,
                              onChanged: (value) {
                                _viewmodel.medicinesListById[_index]
                                    .freqIntake = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          initialValue:
                              _viewmodel.medicinesListById[_index].totalPills,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Total Pills',
                          ),
                          onChanged: (value) => _viewmodel
                              .medicinesListById[_index].totalPills = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          initialValue:
                              _viewmodel.medicinesListById[_index].dose,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Dose',
                          ),
                          onChanged: (value) =>
                              _viewmodel.medicinesListById[_index].dose = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(
                              'Pick Date',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () =>
                                _selectDate(context, _viewmodel, _index),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 13),
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.doorbell_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 2.0),
                                Text(
                                  'Update Inventory Reminder',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            onPressed: () => _onReminderInventoryPressed(
                                context, _index, _viewmodel),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 260.0),
                      _buildButtons(context, _viewmodel, _index)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  ListTile _buildTextLisTile({leading, label, onChanged, onTap, value}) {
    return new ListTile(
      leading: leading,
      title: TextFormField(
        initialValue: value,
        autofocus: false,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }

  Row _buildButtons(
      BuildContext context, MedicineViewmodel viewmodel, int _index) {
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
        SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            if (_viewmodel.medicinesListById[_index].pillsLeft == '' ||
                _viewmodel.medicinesListById[_index].pillsNotify == '') {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Please set inventory reminder '),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ok')),
                  ],
                ),
              );
            } else
              _onSave(context, viewmodel, _index);
          },
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

  Future<void> _selectDate(
      BuildContext context, MedicineViewmodel viewmodel, int index) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(0, 60, 129, 1),
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      //viewmodel.medicinesListById[_index].date =
      //DateFormat.yMMMd().format(newSelectedDate).toString();
      //_selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      viewmodel.medicinesListById[_index].date = newSelectedDate.toString();
    }
  }
}
