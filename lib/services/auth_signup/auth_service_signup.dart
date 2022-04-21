import '../../models/user.dart';

abstract class AuthServiceSignup {
  Future<User> signUp(User users);
}
