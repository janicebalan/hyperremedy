import 'package:flutter/material.dart';

import '../bottomNav.dart';
import '../screens/blood_pressure/bloodpressure_screen.dart';
import '../screens/food/food_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/medicine/medicine_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/report/report_screen.dart';
import '../screens/symptoms/symptoms_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/login':
      return LoginScreen.route();
    case '/home':
      return HomeScreen.route();
    case '/register':
      return RegisterScreen.route();
    case '/food':
      return FoodScreen.route();
    case '/medicine':
      return MedicineScreen.route();
    case '/symptoms':
      return SymptomsScreen.route();
    case '/bloodpressure':
      return BloodPressureScreen.route();
    case '/report':
      return ReportScreen.route();
    case '/bottomnav':
      return BottomNav.route();
  }
  return null;
}
