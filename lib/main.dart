import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/dependencies.dart' as di;
import 'app/router.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'services/auth/auth_service_firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServiceFirebase>(
          create: (_) => AuthServiceFirebase(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthServiceFirebase>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HyperRemedy',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        // home: LoginScreen(),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

navToAttachList(context) async {
  await Navigator.push(context, HomeScreen.route());
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      // Navigator.push(context, MainScreen.route());

    }
    return LoginScreen();
  }
}
