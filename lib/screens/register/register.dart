import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: "Phone Number/Email",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                          height: 10,
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        // login_button
                        const Divider(
                          thickness: 0.5,
                          height: 50,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
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
            ],
          ),
        )),
      ),
    );
  }
}
