import '../../app/dependencies.dart';
import '../../services/auth_signup/auth_service_signup.dart';
import '../../services/rest.dart';

import '../../models/user.dart';

class AuthServiceSignupRest implements AuthServiceSignup {
  RestService get rest => dependency();

  Future<User> signUp(User users) async {
    final json = await rest.post('users', data: users);
    return User.fromJson(json);
  }
}
