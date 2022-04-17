import 'package:flutter/material.dart';
import 'app/dependencies.dart' as di;
import 'app/router.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'HyperRemedy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      onGenerateRoute: createRoute,
    ),
  );
}
