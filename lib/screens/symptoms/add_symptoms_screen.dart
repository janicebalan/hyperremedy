import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/symptoms/symptoms_viewmodel.dart';
import 'package:intl/intl.dart';

import '../../models/symptom.dart';
import '../view.dart';

class AddSymptomsScreen extends StatelessWidget {
  AddSymptomsScreen({data, viewmodel})
      : _data = data,
        _viewmodel = viewmodel;
  String _data;
  SymptomsViewmodel _viewmodel;

  String _selectedDate;
  void _onSave(context, _viewmodel) {
    var _symptoms = new Symptom(
        type: _viewmodel.type,
        date: _viewmodel.date,
        description: _viewmodel.description,
        userID: _data);
    Navigator.pop(context, _symptoms);
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Add New Symptoms',
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
                      leading: const Icon(Icons.sports_tennis_rounded),
                      label: 'Type',
                      value: _viewmodel.type,
                      onChanged: (value) => _viewmodel.type = value,
                    ),
                    _buildTextLisTile(
                      leading: const Icon(Icons.article_outlined),
                      label: 'Description',
                      value: _viewmodel.description,
                      onChanged: (value) => _viewmodel.description = value,
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

  ListTile _buildTextLisTile({leading, label, value, onChanged, onTap}) {
    return new ListTile(
      leading: leading,
      title: TextFormField(
        initialValue: value,
        autofocus: true,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }

  Row _buildButtons(BuildContext context, SymptomsViewmodel viewmodel) {
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
          onPressed: () => _onSave(context, viewmodel),
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
      BuildContext context, SymptomsViewmodel viewmodel) async {
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
      _selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      print(viewmodel.date);
    }
  }
}
