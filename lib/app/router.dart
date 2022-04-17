import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    // case '/food':
    //   return FoodScreen.route();
    case '/home':
      return HomeScreen.route();
    case '/login':
      return LoginScreen.route();
    case '/register':
      return RegisterScreen.route();
  }
  return null;
}
