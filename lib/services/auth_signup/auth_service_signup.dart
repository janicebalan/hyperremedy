import '../../models/user.dart';

abstract class AuthServiceSignup {
  Future<User> signUp(
      {String name,
      String phoneNo,
      String yearBorn,
      String email,
      String password});
}
