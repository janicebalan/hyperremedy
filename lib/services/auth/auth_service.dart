import '../../models/user.dart';

abstract class AuthService {
  Future<User> authenticate({String email, String password});
  Future<void> signout();
}
