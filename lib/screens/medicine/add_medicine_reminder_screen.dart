import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/medicine.dart';
import '../../models/reminder.dart';
import '../view.dart';
import 'medicine_viewmodel.dart';

class AddMedicineReminderScreen extends StatelessWidget {
  AddMedicineReminderScreen({index, viewmodel})
      : _index = index,
        _viewmodelMed = viewmodel;
  int _index;
  MedicineViewmodel _viewmodelMed;

  // void _onSave(context, _viewmodel, _data) {
  //   var _medicines = new Medicine(dose: _viewmodel.dose);
  //   Navigator.pop(context, _medicines);
  // }

  //String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: MedicineViewmodel.overloadedContructorNamedArguments(
            _viewmodelMed.medicinesListById[_index].id),
        builder: (_context, _viewmodel, _child) {
          print(_viewmodelMed.medicinesListById[_index].id);
          return new Scaffold(
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            appBar: new AppBar(
              toolbarHeight: 70.0,
              title: Text(
                'Medicine Reminder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromRGBO(82, 86, 232, 1),
            ),
            body: _viewmodel.remindersListById.length == 0
                ? Container(
                    child: Center(
                      child: Text(
                        "No reminders",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: _buildListView(
                        _viewmodel.remindersListById, _viewmodel)),
            floatingActionButton: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
              onPressed: () {
                _selectTime(context, _viewmodelMed.medicinesListById[_index].id,
                    _viewmodel);
              },
              label: Text('Add Reminder Time'),
              icon: Icon(Icons.alarm),
            ),
          );
        });
  }

  ListView _buildListView(List _remindersList, MedicineViewmodel _viewmodel) {
    return ListView.separated(
      itemCount: _remindersList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) =>
          _listTile(index, context, _remindersList, _viewmodel),
    );
  }

  ListTile _listTile(int index, BuildContext context, List _remindersList,
      MedicineViewmodel _viewmodel) {
    return ListTile(
      title: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          iconColor: Color.fromRGBO(82, 86, 232, 1),
          leading: Icon(Icons.access_alarms),
          title: Text(
            '${_remindersList[index].hour}:${_remindersList[index].minute}',
            style: const TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          trailing: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Are you sure you want to remove this reminder?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          _viewmodel.removeReminders(
                              _viewmodel.remindersList[index],
                              index,
                              _viewmodel.remindersList[index].id);
                          Navigator.pop(context);
                        },
                        child: Text('Yes')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                  ],
                ),
              );
            },
            child: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(
      BuildContext context, String id, MedicineViewmodel viewmodel) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null) {
      var _reminders = new Reminder(
        hour: picked_s.hour,
        minute: picked_s.minute,
        medsId: id,
      );
      viewmodel.addReminders(_reminders);

      selectedTime = picked_s;
    }
    ;
  }

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
        SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {},
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
