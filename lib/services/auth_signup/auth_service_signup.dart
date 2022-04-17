import '../../models/user.dart';

abstract class AuthServiceSignup {
  Future<User> signUp({String email, String password, String username});
}
