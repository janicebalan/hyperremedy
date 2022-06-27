import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/medicine.dart';
import '../view.dart';
import 'add_inventory_reminder_screen.dart';
import 'add_medicine_reminder_screen.dart';
import 'medicine_viewmodel.dart';

class AddMedicineScreen extends StatelessWidget {
  AddMedicineScreen({data, viewmodel})
      : _data = data,
        _viewmodel = viewmodel;
  String _data;
  MedicineViewmodel _viewmodel;

  String _selectedDate;
  void _onSave(context, _viewmodel, _data) {
    var _medicines = new Medicine(
      medicineName: _viewmodel.medicineName,
      freqIntake: _viewmodel.freqIntake,
      totalPills: _viewmodel.totalPills,
      pillsLeft: _viewmodel.pillsLeft,
      pillsNotify: _viewmodel.pillsNotify,
      userID: _data,
      dose: _viewmodel.dose,
      date: _viewmodel.date,
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
      BuildContext context, String data, MedicineViewmodel viewmodel) async {
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddInventoryReminderScreen(data: data, viewmodel: viewmodel)));

    if (medicines != null) {
      medicines.pillsLeft = _viewmodel.pillsLeft;
      medicines.pillsNotify = _viewmodel.pillsNotify;
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
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              toolbarHeight: 70,
              title: Text(
                'Add New Medicines',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
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
                        onChanged: (value) => _viewmodel.medicineName = value,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Frequency of Intake'),
                            DropdownButtonFormField(
                              value: _viewmodel.selectedValue,
                              items: dropdownItems,
                              onChanged: (value) {
                                _viewmodel.freqIntake = value;
                                _viewmodel.selectedValue = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Total Pills',
                          ),
                          onChanged: (value) => _viewmodel.totalPills = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      ListTile(
                        leading: null,
                        title: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Dose',
                          ),
                          onChanged: (value) => _viewmodel.dose = value,
                          onTap: () {},
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(
                              'Pick Date',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () => _selectDate(context, _viewmodel),
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
                                  'Set Inventory Reminder',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            onPressed: () => _onReminderInventoryPressed(
                                context, _data, _viewmodel),
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
                      _buildButtons(context, _viewmodel, _data),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  ListTile _buildTextLisTile({leading, label, onChanged, onTap}) {
    return new ListTile(
      leading: leading,
      title: TextFormField(
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
        SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            if (_viewmodel.pillsLeft == '' || _viewmodel.pillsNotify == '') {
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
              _onSave(context, viewmodel, data);
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
      BuildContext context, MedicineViewmodel viewmodel) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(82, 86, 232, 1),
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
      //viewmodel.date = DateFormat.yMMMd().format(newSelectedDate).toString();
      //_selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      viewmodel.date = newSelectedDate.toString();
    }
  }
}
