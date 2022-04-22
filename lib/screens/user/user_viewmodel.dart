import 'package:hyperremedy/services/auth_signup/auth_service_signup.dart';

import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  //AuthServiceSignup get _service1 => dependency();
  User _user;
  int _currentIndex;

  // String _name;
  // String _phoneNo;
  // String _yearBorn;
  // String _password;
  // String _email;

  get user => _user;
  set user(value) => _user = value;
  bool get isUserSignedIn => _user != null;

  dynamic _id;
  get id => _id;
  set id(value) => _id = value;

  // get name => _name;
  // set name(value) => _name = value;

  // get phoneNo => _phoneNo;
  // set phoneNo(value) => _phoneNo = value;

  // get yearBorn => _yearBorn;
  // set yearBorn(value) => _yearBorn = value;

  // get password => _password;
  // set password(value) => _password = value;

  // get email => _email;
  // set email(value) => _email = value;

  void authenticate(User user) async => _user =
      await _service.authenticate(email: user.email, password: user.password);

  // void signUp(User user) async {
  //   turnBusy();
  //   if (user.phoneNo == null) {
  //     user.phoneNo = "";
  //   }
  //   await _service1.signUp(user);
  //   turnIdle();
  // }

  get currentIndex => _currentIndex;
  set currentIndex(value) {
    //turnBusy();
    _currentIndex = value;
    //turnIdle();
  }
}
