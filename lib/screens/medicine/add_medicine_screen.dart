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
        datetime: _viewmodel.datetime,
        totalPills: _viewmodel.totalPills,
        freqIntake: _viewmodel.freqIntake,
        duration: _viewmodel.duration,
        medsNotify: _viewmodel.medsNotify,
        dose: _viewmodel.dose,
        pillsLeft: _viewmodel.pillsLeft,
        pillsNotify: _viewmodel.pillsNotify,
        userID: _data);
    Navigator.pop(context, _medicines);
  }

  void _onReminderMedicinePressed(
      BuildContext context, String data, MedicineViewmodel viewmodel) async {
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddMedicineReminderScreen(data: data, viewmodel: viewmodel)));

    if (medicines != null) {
      medicines.duration = viewmodel.duration;
      medicines.medsNotify = _viewmodel.medsNotify;
      medicines.dose = _viewmodel.dose;
    } else {
      print("Null value");
    }
  }

  void _onReminderInventoryPressed(
      BuildContext context, String data, MedicineViewmodel viewmodel) async {
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddInventoryReminderScreen(data: data, viewmodel: viewmodel)));

    if (medicines != null) {
      medicines.pillsLeft = viewmodel.pillsLeft;
      medicines.pillsNotify = _viewmodel.pillsNotify;
    } else {
      print("Null value");
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Twice a day"), value: "Twice a day"),
      DropdownMenuItem(child: Text("Cramps"), value: "Cramps"),
      DropdownMenuItem(child: Text("Coughs"), value: "Coughs"),
      DropdownMenuItem(child: Text("Fatigue"), value: "Fatigue"),
      DropdownMenuItem(child: Text("Headaches"), value: "Headaches"),
      DropdownMenuItem(child: Text("Allergies"), value: "Allergies"),
      DropdownMenuItem(child: Text("Memory loss"), value: "Memory loss"),
      DropdownMenuItem(child: Text("Cough"), value: "Cough"),
      DropdownMenuItem(child: Text("Fever"), value: "Fever"),
      DropdownMenuItem(child: Text("Sore throat"), value: "Sore throat"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  //String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Add New Medicines',
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
                        onChanged: (value) =>
                            _viewmodel.totalPills = int.parse(value),
                        onTap: () {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    // _buildTextLisTile(
                    //   leading: const Icon(Icons.sports_tennis_rounded),
                    //   label: 'Type',
                    //   onChanged: (value) => _viewmodel.type = value,
                    // ),

                    ElevatedButton(
                      child: Text(
                        'Pick Date',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _selectDate(context, _viewmodel),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(6, 72, 130, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Set Medicine Reminder',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => _onReminderMedicinePressed(
                          context, _data, _viewmodel),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Set Inventory Reminder',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => _onReminderInventoryPressed(
                          context, _data, _viewmodel),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buildButtons(context, _viewmodel, _data)
                  ],
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
        SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () => _onSave(context, viewmodel, data),
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
      viewmodel.datetime =
          DateFormat.yMMMd().format(newSelectedDate).toString();
      _selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      //print(viewmodel.date);
    }
  }
}
