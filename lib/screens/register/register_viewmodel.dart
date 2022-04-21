import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../services/auth_signup/auth_service_signup.dart';
import '../viewmodel.dart';

class RegisterViewmodel extends Viewmodel {
  AuthServiceSignup get _service => dependency();

  String _name;
  String _phoneNo;
  String _yearBorn;
  String _password;
  String _email;

  get name => _name;
  set name(value) => _name = value;

  get phoneNo => _phoneNo;
  set phoneNo(value) => _phoneNo = value;

  get yearBorn => _yearBorn;
  set yearBorn(value) => _yearBorn = value;

  get password => _password;
  set password(value) => _password = value;

  get email => _email;
  set email(value) => _email = value;

  void signUp(User user) async {
    turnBusy();
    await _service.signUp(user);
    turnIdle();
  }
}
