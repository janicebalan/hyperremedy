import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  String formattedDate =
      DateFormat('EEEEE, d MMMM yyyy').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          //background 2 boxes
          Container(
            height: MediaQuery.of(context).size.height,
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
                  flex: 10,
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
    );
  }
}
