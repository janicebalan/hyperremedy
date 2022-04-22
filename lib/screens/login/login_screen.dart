import 'package:flutter/material.dart';
import 'package:hyperremedy/screens/login/login_viewmodel.dart';

import '../../bottomNav.dart';
import '../../models/user.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';
import '../view.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();

    if (_user != null) {
      //print(_user.id);
      Navigator.push(context, HomeScreen.route(user: _user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      builder: (context, viewmodel, _) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
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
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          //padding for the log and title
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 50),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.5),
                              ),

                              // #welcome
                            ],
                          ),
                        ),
                      ),
                      Expanded(
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
                  padding: const EdgeInsets.symmetric(vertical: 250.0),
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
                      height: 350,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (value) => viewmodel.email = value),
                          ),
                          const Divider(
                            thickness: 0.5,
                            height: 10,
                          ),
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (value) =>
                                    viewmodel.password = value),
                          ),
                          if (viewmodel.showErrorMessage)
                            Text(
                              'Invalid username or password!',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20.0),
                            ),
                          // login_button
                          const Divider(
                            thickness: 0.5,
                            height: 50,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () => _onLogin(context, viewmodel),
                              height: 45,
                              minWidth: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: const Color.fromRGBO(0, 61, 122, 1),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          // #text
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, RegisterScreen.route());
                              },
                              child: Text(
                                "Don't have an account? Register",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
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
          )),
        ),
      ),
    );
  }
}
