import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../view.dart';
import '../symptoms_viewmodel.dart';

class Body extends StatelessWidget {
  Body({data}) : _viewmodel = data;
  final SymptomsViewmodel _viewmodel;
  String _data;
  //FoodViewmodel _foodViewmodel = FoodViewmodel();
  //SymptomsViewmodel _symptomsViewmodel = SymptomsViewmodel(_data);

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
                    color: const Color.fromRGBO(221, 223, 237, 0.25),
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
                                'List of Symptoms',
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
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: _buildListView(_viewmodel)),
              ),
            ],
          )),
    );
  }

  ListView _buildListView(SymptomsViewmodel _viewmodel) {
    //print(_viewmodel.symptomList.length);
    return ListView.separated(
      itemCount: _viewmodel.symptomList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => _listTile(index, context, _viewmodel),
    );
  }

  ListTile _listTile(
      int index, BuildContext context, SymptomsViewmodel _viewmodel) {
    return ListTile(
      title: Card(
        color: Color.fromRGBO(4, 25, 136, 0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            // leading: ConstrainedBox(
            //   constraints: BoxConstraints(
            //     minWidth: 44,
            //     minHeight: 70,
            //     maxWidth: 80,
            //     maxHeight: 80,
            //   ),
            //   child: Image.network(
            //     _viewmodel.symptomListById[index].type,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                '${_viewmodel.symptomListById[index].type}',
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            subtitle: Text(
                ' ${_viewmodel.symptomListById[index].description}\n\n${_viewmodel.symptomListById[index].date}',
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify),

            trailing: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        Text('Are you sure you want to remove this symptom?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            _viewmodel.removeSymptom(
                                _viewmodel.symptomListById[index], index);
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
              color: Color.fromRGBO(211, 62, 62, 1),
              child: Text(
                'Remove',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
