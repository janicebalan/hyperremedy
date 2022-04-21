import 'package:hyperremedy/services/auth_signup/auth_service_signup.dart';

import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  AuthServiceSignup get _service1 => dependency();
  User _user;
  int _currentIndex;

  get user => _user;
  set user(value) => _user = value;
  bool get isUserSignedIn => _user != null;

  void authenticate(User user) async => _user =
      await _service.authenticate(email: user.email, password: user.password);

  void signUp(User user) async {
    turnBusy();
    await _service1.signUp(user);
    turnIdle();
  }

  get currentIndex => _currentIndex;
  set currentIndex(value) {
    //turnBusy();
    _currentIndex = value;
    //turnIdle();
  }
}
