import '../../models/user.dart';

abstract class UserService {
  Future<User> getUserById({dynamic id});
}
