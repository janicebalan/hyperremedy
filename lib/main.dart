import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/medicine/notification_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/dependencies.dart' as di;
import 'app/router.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/medicine/notification/notification_api.dart';
import 'screens/medicine/notification/notification_voice.dart';
import 'services/auth/auth_service_firebase.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationApi.init(initScheduled: true);
  await NotificationVoice.init(initScheduled: true);
  await Firebase.initializeApp();
  di.init();

  runApp(
    MaterialApp(
      title: 'HyperRemedy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //initialRoute: '/splash',
      initialRoute: '/splash',
      onGenerateRoute: createRoute,
    ),
  );
}

class SplashScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SplashScreen());
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();

    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NotificationScreen(payload: payload)));

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(82, 86, 232, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Sz8264VVV7430MzqD2TE3gZueW_gQqPLrxyCk4V79SJVe8z69UUIEODfYWvtJ0JQqFk&usqp=CAU'),
                  radius: 50,
                ),
              ),
              // #signup_text
              Text(
                "HyperRemedy",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30.5),
              ),

              // #welcome
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var id = prefs.getString('id');
    if (token != null && id != null) {
      Navigator.push(context, HomeScreen.route(id: id));
    } else {
      Navigator.push(context, LoginScreen.route());
    }
  }
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
