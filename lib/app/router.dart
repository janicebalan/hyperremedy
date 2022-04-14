import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';
import '../screens/register/register.dart';

Route<dynamic>? createRoute(settings) {
  switch (settings.name) {
    // case '/home':
    //   return HomeScreen.route();
    // case '/food':
    //   return FoodScreen.route();
    case '/register':
      return RegisterScreen.route();
    case '/login':
      return LoginScreen.route();
  }
  return null;
}
