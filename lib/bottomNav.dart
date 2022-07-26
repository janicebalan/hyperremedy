import 'package:flutter/material.dart';

import 'app/router.dart';
import 'models/user.dart';
import 'screens/home/home_screen.dart';
import 'screens/user/user_viewmodel.dart';
import 'screens/view.dart';

class BottomNav extends StatelessWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => BottomNav(user: user));
  //final user;
  BottomNav({user}) : _user = user;
  User _user;

  @override
  Widget build(BuildContext context) {
    //print(_user.id);
    final _navigatorKey = GlobalKey<NavigatorState>();
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/home',
        onGenerateRoute: createRoute,
      ),
      bottomNavigationBar: View(
        viewmodel: UserViewmodel(),
        builder: (context, viewmodel, _) {
          viewmodel.currentIndex = 0;
          return BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(0, 48, 97, 1),
              selectedItemColor: Colors.greenAccent,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: viewmodel.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  tooltip: 'Home',
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety),
                  tooltip: 'Medicine',
                  label: 'Medicine',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood),
                  tooltip: 'Food',
                  label: 'Food',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bloodtype),
                  tooltip: 'Blood Pressure',
                  label: 'Blood Pressure',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cable),
                  tooltip: 'Symptoms',
                  label: 'Symptoms',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics),
                  tooltip: 'Graph & Statistics',
                  label: 'Graph & Statistics',
                ),
              ],
              showUnselectedLabels: true,
              onTap: (index) {
                switch (index) {
                  case 0:
                    {
                      // _navigatorKey.currentState
                      //     .push(HomeScreen.route(data: _user));
                      //print(_user.name);
                      _navigatorKey.currentState
                          .pushNamed('/home', arguments: _user);
                    }
                    break;
                  case 1:
                    {
                      _navigatorKey.currentState
                          .pushNamed('/medicine', arguments: _user);
                    }
                    break;
                  case 2:
                    {
                      _navigatorKey.currentState
                          .pushNamed('/food', arguments: _user);
                    }
                    break;
                  case 3:
                    {
                      _navigatorKey.currentState
                          .pushNamed('/bloodpressure', arguments: _user);
                    }
                    break;
                  case 4:
                    {
                      _navigatorKey.currentState
                          .pushNamed('/symptoms', arguments: _user);
                    }
                    break;
                  case 5:
                    {
                      _navigatorKey.currentState
                          .pushNamed('/report', arguments: _user);
                    }
                    break;
                }
                //setState(() {
                //_currentIndex = index;
                //});
                viewmodel.currentIndex = index;
              });
        },
      ),
    );
  }
}
