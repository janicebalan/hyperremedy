import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/medicine/notification/notification_api.dart';
import 'package:intl/intl.dart';

import '../../view.dart';
import '../add_medicine_reminder_screen.dart';
import '../edit/edit_medicine_screen.dart';
import '../medicine_viewmodel.dart';

class Body extends StatelessWidget {
  Body({data}) : _viewmodel = data;
  final MedicineViewmodel _viewmodel;
  String _data;
  //FoodViewmodel _foodViewmodel = FoodViewmodel();
  //SymptomsViewmodel _symptomsViewmodel = SymptomsViewmodel(_data);

  void _onEdit(
      MedicineViewmodel viewmodel, int index, BuildContext context) async {
    print("hello");
    final medicines = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditMedicineScreen(index: index, viewmodel: viewmodel)));
    if (medicines != null) {
      viewmodel.updateMedicines(index, medicines);
    } else {
      print("Null value");
      print(medicines);
    }
  }

  void _onReminder(
      BuildContext context, int index, MedicineViewmodel viewmodel) async {
    final reminders = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddMedicineReminderScreen(index: index, viewmodel: viewmodel)));

    if (reminders != null) {
    } else {
      print("Null value");
    }
  }

  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _viewmodel,
      builder: (_context, _viewmodel, _child) => Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  //background 2 boxes
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(221, 223, 237, 0.25),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 48, 97, 1),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  formattedDate,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.white),
                                ),

                                // #welcome
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(221, 223, 237, 0.25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //key in box
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        width: 300,
                        height: 60,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'List of Medicines',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: _viewmodel.medicinesList.length == 0
                    ? Container(
                        child: Center(
                          child: Text(
                            "No medicines",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: _buildListView(_viewmodel)),
              ),
            ],
          )),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
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

// if (picked_s != null && picked_s != selectedTime )
//   setState(() {
//     selectedTime = picked_s;
//   });
  }

  ListView _buildListView(MedicineViewmodel _viewmodel) {
    return ListView.separated(
      itemCount: _viewmodel.medicinesList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => _listTile(index, context, _viewmodel),
    );
  }

  ListTile _listTile(
      int index, BuildContext context, MedicineViewmodel _viewmodel) {
    return ListTile(
      title: InkWell(
        onTap: () {
          _onEdit(_viewmodel, index, context);
        },
        child: Card(
          color: int.parse(_viewmodel.medicinesListById[index].pillsLeft) < 1
              ? Color.fromRGBO(106, 119, 205, 0.7)
              : Color.fromRGBO(4, 25, 136, 0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              dense: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  '${_viewmodel.medicinesListById[index].medicineName}',
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      ' ${_viewmodel.medicinesListById[index].date}\n${_viewmodel.medicinesListById[index].freqIntake}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                          "${_viewmodel.medicinesListById[index].pillsLeft} pills left"))
                ],
              ),
              trailing: Column(
                children: [
                  InkWell(
                    //onTap: () => _onReminder(context, index, _viewmodel),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMedicineReminderScreen(
                                  index: index, viewmodel: _viewmodel)));
                    },
                    child: Icon(
                      Icons.alarm,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              'Are you sure you want to remove this reading?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  _viewmodel.removeMedicines(
                                      _viewmodel.medicinesListById[index],
                                      index);
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
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
