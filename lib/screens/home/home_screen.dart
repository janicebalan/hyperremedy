import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/user/user_viewmodel.dart';

import '../../models/user.dart';
import '../login/login_screen.dart';
import '../login/login_viewmodel.dart';
import '../view.dart';
import 'widget/body.dart';

class HomeScreen extends StatelessWidget {
  static Route route({id}) =>
      MaterialPageRoute(builder: (context) => HomeScreen(id: id));

  HomeScreen({id}) : _data = id;
  String _data;

  final LoginViewmodel viewmodel = LoginViewmodel();
  void logout() async {
    await viewmodel.signout();
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: UserViewmodel.overloadedContructorNamedArguemnts(_data),
      builder: (_context, _viewmodel, _child) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              title: const Text(
                'HyperRemedy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure you want to logout?'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                logout();
                                Navigator.pushNamed(context, "/login");
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
                )
              ],
              backgroundColor: const Color.fromRGBO(82, 86, 232, 1),
            ),
            body: Body(data: _data),
          ),
        ),
      ),
    );
  }
}
