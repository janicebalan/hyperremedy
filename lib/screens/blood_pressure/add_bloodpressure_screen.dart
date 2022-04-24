import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../models/bloodpressure.dart';
import '../view.dart';
import 'bloodpressure_viewmodel.dart';

class AddBloodPressureScreen extends StatefulWidget {
  AddBloodPressureScreen({data, viewmodel})
      : _data = data,
        _viewmodel = viewmodel;
  String _data;
  BloodPressureViewmodel _viewmodel;

  @override
  State<AddBloodPressureScreen> createState() => _AddBloodPressureScreenState();
}

class _AddBloodPressureScreenState extends State<AddBloodPressureScreen> {
  String _selectedDate;

  void _onSave(context, _viewmodel, _data) {
    var _bloodpressures = new BloodPressure(
        range: '',
        date: _viewmodel.date,
        diastolic: _viewmodel.diastolic,
        systolic: _viewmodel.systolic,
        pulse: _viewmodel.pulse,
        userID: _data);
    Navigator.pop(context, _bloodpressures);
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: widget._viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Add New Readings',
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
                    // _buildTextLisTile(
                    //   leading: const Icon(Icons.sports_tennis_rounded),
                    //   label: 'Type',
                    //   onChanged: (value) => _viewmodel.range = value,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Readings Value'),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText:
                                  '${_viewmodel.systolic} sys / ${_viewmodel.diastolic} dia / ${_viewmodel.pulse} pulse',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            onChanged: (value) {
                              _viewmodel.type = value;
                              _viewmodel.selectedValue = value;
                            },
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Input Readings',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => pickValue(context, _viewmodel),
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
                    SizedBox(height: 30.0),
                    _buildButtons(context, _viewmodel)
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

  Row _buildButtons(BuildContext context, BloodPressureViewmodel viewmodel) {
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
          onPressed: () => _onSave(context, viewmodel, widget._data),
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
      BuildContext context, BloodPressureViewmodel viewmodel) async {
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
      viewmodel.date = DateFormat.yMMMd().format(newSelectedDate).toString();
      //_selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      //print(viewmodel.date);
    }
  }

  void pickValue(BuildContext context, BloodPressureViewmodel viewmodel) {
    //print(viewmodel.systolic);
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Blood Pressure Readings"),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Container(
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          NumberPicker(
                            value: viewmodel.systolic,
                            minValue: 0,
                            maxValue: 230,
                            onChanged: (value) {
                              {
                                viewmodel.systolic = value;
                                SBsetState(() => viewmodel.systolic = value);
                              }
                            },
                          ),
                          Text('Sys'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          NumberPicker(
                            value: viewmodel.diastolic,
                            minValue: 0,
                            maxValue: 135,
                            onChanged: (value) {
                              {
                                viewmodel.diastolic = value;
                                SBsetState(() => viewmodel.diastolic = value);
                              }
                            },
                          ),
                          Text('Dia'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          NumberPicker(
                            value: viewmodel.pulse,
                            minValue: 0,
                            maxValue: 220,
                            onChanged: (value) {
                              {
                                viewmodel.pulse = value;
                                SBsetState(() => viewmodel.pulse = value);
                              }
                            },
                          ),
                          Text('Pulse'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
