import 'package:flutter/material.dart';
import '../view.dart';
import 'medicine_screen.dart';
import 'medicine_viewmodel.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({payload}) : _payload = payload;
  String _payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel:
          MedicineViewmodel.overloadedContructorGetMedicine(widget._payload),
      builder: (_context, _viewmodel, _child) => WillPopScope(
        onWillPop: () => Future.value(true),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'HyperRemedy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (int.parse(_viewmodel.medicinesReminder.pillsLeft) <=
                          int.parse(_viewmodel.medicinesReminder.pillsNotify))
                      ? Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4lruijg9ArdMd56-BfUJFh0bwERtEG6o0JCndmAYFDWqdBgMrAt-QaN2EjiuWVQsOgV0&usqp=CAU')
                      : Image.network(
                          'https://cdn.dribbble.com/users/2185205/screenshots/7886140/02-lottie-tick-01-instant-2.gif'),
                  (_viewmodel.medicinesReminder.pillsLeft == "0")
                      ? Text(
                          '',
                        )
                      : Text(
                          'Successfully taken ${_viewmodel.medicinesReminder.dose} of ${_viewmodel.medicinesReminder.medicineName} pills!',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  (int.parse(_viewmodel.medicinesReminder.pillsLeft) <=
                          int.parse(_viewmodel.medicinesReminder.pillsNotify))
                      ? Column(
                          children: [
                            Text(
                              '\nReminder you have ${_viewmodel.medicinesReminder.pillsLeft} pill(s) left! ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                'Do not forget to go to the nearest pharmacy to get new pills!'),
                          ],
                        )
                      : Text(
                          'Reminder you have ${_viewmodel.medicinesReminder.pillsLeft} pills left!'),
                  ElevatedButton(
                    child: Text('Ok'),
                    onPressed: () => Navigator.push(
                        context,
                        MedicineScreen.route(
                            data: _viewmodel.medicinesReminder.userID)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 102, 102, 1),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
