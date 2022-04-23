import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../login/login_screen.dart';
import '../view.dart';
import 'register_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);
  static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewmodel _viewmodel;

  String _onSave(viewmodel) {
    var _users = new User(
        name: viewmodel.name,
        password: viewmodel.password,
        phoneNo: viewmodel.phoneNo,
        email: viewmodel.email,
        yearBorn: viewmodel.yearBorn);

    if (_users != null) {
      viewmodel.signUp(_users);
      Navigator.push(context, LoginScreen.route());
      return "done";
    }
  }

  final _formKey = GlobalKey<FormState>();
  String validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: RegisterViewmodel(),
      builder: (context, _viewmodel, _) => WillPopScope(
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
                Form(
                  key: _formKey,
                  child: Padding(
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
                        height: 400,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _viewmodel.name = value;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Name",
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                      _viewmodel.password = value,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Password",
                                    suffixIcon: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: !_viewmodel.showPassword
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: Colors.black,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              ),
                                        onPressed: () =>
                                            _viewmodel.showPassword =
                                                !_viewmodel.showPassword),
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                      _viewmodel.phoneNo = value,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Phone Number",
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: TextFormField(
                                  validator: (value) => validateEmail(value),
                                  onChanged: (value) =>
                                      _viewmodel.email = value,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Email",
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your year Born';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                      _viewmodel.yearBorn = value,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Year Born",
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            // login_button
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    var result = _onSave(_viewmodel);
                                    if (result == "done") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Account successfully created')),
                                      );
                                    }
                                  }
                                },
                                height: 45,
                                minWidth: 200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: const Color.fromRGBO(0, 61, 122, 1),
                                child: const Text(
                                  "Register",
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
                                  Navigator.push(context, LoginScreen.route());
                                },
                                child: Text(
                                  "Already have an account? Log In",
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
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
