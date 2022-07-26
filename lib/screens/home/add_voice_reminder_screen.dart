import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/medicine.dart';
import '../../models/reminder.dart';
import '../medicine/medicine_viewmodel.dart';
import '../view.dart';

class AddVoiceReminderScreen extends StatelessWidget {
  AddVoiceReminderScreen({data}) : _data = data;
  String _data;
  //MedicineViewmodel _viewmodelMed;

  // void _onSave(context, _viewmodel, _data) {
  //   var _medicines = new Medicine(dose: _viewmodel.dose);
  //   Navigator.pop(context, _medicines);
  // }

  //String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: MedicineViewmodel.overloadedContructorVoice(_data),
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            appBar: new AppBar(
              toolbarHeight: 70.0,
              title: Text(
                'Voice Reminder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromRGBO(82, 86, 232, 1),
            ),
            body: _viewmodel.voiceListById.length == 0
                ? Container(
                    child: Center(
                      child: Text(
                        "No voice reminders.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    child:
                        _buildListView(_viewmodel.voiceListById, _viewmodel)),
            floatingActionButton: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
              onPressed: () {
                _selectTime(context, _data, _viewmodel);
              },
              label: Text('Add Voice Reminder Time'),
              icon: Icon(Icons.alarm),
            ),
          );
        });
  }

  ListView _buildListView(List _voiceList, MedicineViewmodel _viewmodel) {
    return ListView.separated(
      itemCount: _voiceList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) =>
          _listTile(index, context, _voiceList, _viewmodel),
    );
  }

  ListTile _listTile(int index, BuildContext context, List _voiceList,
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
            '${_voiceList[index].hour}:${_voiceList[index].minute}',
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
                          _viewmodel.removeVoiceReminders(
                              _viewmodel.voiceList[index],
                              index,
                              _viewmodel.voiceList[index].id);
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
      viewmodel.addVoiceReminders(_reminders);

      selectedTime = picked_s;
    }
    ;
  }
}
