import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../services/auth_signup/auth_service_signup.dart';
import '../viewmodel.dart';

class RegisterViewmodel extends Viewmodel {
  AuthServiceSignup get _service => dependency();
  User _user = User();
  get user => _user;
  set user(value) => _user = value;

  //String _name;
  String _phoneNo;
  String _yearBorn;
  String _password;
  String _email;
  bool _showPassword = false;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get name => _user.name;
  set name(value) {
    turnBusy();
    _user.name = value;
    turnIdle();
  }

  get phoneNo => _user.phoneNo;
  set phoneNo(value) {
    turnBusy();
    _user.phoneNo = value;
    turnIdle();
  }

  get yearBorn => _user.yearBorn;
  set yearBorn(value) {
    turnBusy();
    _user.yearBorn = value;
    turnIdle();
  }

  get email => _user.email;
  set email(value) {
    turnBusy();
    _user.email = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _user.password = value;
    turnIdle();
  }

  // get name => _user.name;
  // set name(value) => _user.name = value;

  // get phoneNo => _phoneNo;
  // set phoneNo(value) => _phoneNo = value;

  // get yearBorn => _yearBorn;
  // set yearBorn(value) => _yearBorn = value;

  // get password => _password;
  // set password(value) => _password = value;

  // get email => _email;
  // set email(value) => _email = value;

  // void signUp(User user) async {
  //   turnBusy();
  //   await _service.signUp(user);
  //   turnIdle();
  // }

  Future<User> authenticate() async {
    turnBusy();
    final User _user = await _service.signUp(
        name: name,
        phoneNo: phoneNo,
        yearBorn: yearBorn,
        email: email,
        password: password);
    //if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }
}
