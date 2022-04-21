// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../../view.dart';
import '/screens/food/food_viewmodel.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  Body({index, state})
      : _index = index,
        _state = state;
  var _index;
  final _state;
  FoodViewmodel _foodViewmodel = FoodViewmodel();

  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _foodViewmodel,
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
                    color: const Color.fromRGBO(216, 212, 212, 1),
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
                              color: Color.fromRGBO(216, 212, 212, 1),
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
                                'List of Food Suggestions',
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
              Container(
                height: 50,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        _index = 1;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Low",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        _index = 2;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Normal",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        _index = 3;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "High",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  ListView _buildListView(FoodViewmodel _viewmodel) {
    return ListView.separated(
      itemCount: _viewmodel.foodList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => _listTile(index, context, _viewmodel),
    );
  }

  ListTile _listTile(
      int index, BuildContext context, FoodViewmodel _viewmodel) {
    if (_index == 0) {
      return ListTile(
        title: Card(
          color: Color.fromRGBO(0, 48, 97, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 70,
                  maxWidth: 80,
                  maxHeight: 80,
                ),
                child: Image.network(
                  _viewmodel.foodList[index].photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  '${_viewmodel.foodList[index].foodName}',
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              subtitle: Text(' ${_viewmodel.foodList[index].foodDetails}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify),
            ),
          ),
        ),
      );
    }
    if (_index == 1) {
      if (_viewmodel.foodList[index].range == 'low') {
        return ListTile(
          title: Card(
            color: Color.fromRGBO(0, 48, 97, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 70,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  child: Image.network(
                    _viewmodel.foodList[index].photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    '${_viewmodel.foodList[index].foodName}',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                subtitle: Text(' ${_viewmodel.foodList[index].foodDetails}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ),
          ),
        );
      }
    }
    if (_index == 2) {
      if (_viewmodel.foodList[index].range == 'normal') {
        return ListTile(
          title: Card(
            color: Color.fromRGBO(0, 48, 97, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 70,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  child: Image.network(
                    _viewmodel.foodList[index].photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    '${_viewmodel.foodList[index].foodName}',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                subtitle: Text(' ${_viewmodel.foodList[index].foodDetails}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ),
          ),
        );
      }
    }
    if (_index == 3) {
      if (_viewmodel.foodList[index].range == 'high') {
        return ListTile(
          title: Card(
            color: Color.fromRGBO(0, 48, 97, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 70,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  child: Image.network(
                    _viewmodel.foodList[index].photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    '${_viewmodel.foodList[index].foodName}',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                subtitle: Text(' ${_viewmodel.foodList[index].foodDetails}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ),
          ),
        );
      }
    }
  }
}
