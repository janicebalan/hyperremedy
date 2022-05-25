import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  UserService get _service1 => dependency();
  User _user;

  User _userById;
  UserViewmodel();
  UserViewmodel.overloadedContructorNamedArguemnts(dynamic id) {
    // print("constructor here");
    // print(id);
    //getUserById(id);
  }

  get user => _user;
  set user(value) => _user = value;
  get userById => _userById;
  set userById(value) => _userById = value;
  bool get isUserSignedIn => _user != null;

  void authenticate(User user) async => _user =
      await _service.authenticate(email: user.email, password: user.password);

  void signout() async {
    _user = null;
    await _service.signout();
  }

  // void getUserById(String id) async {
  //   turnBusy();
  //   print("doing get user by id");
  //   _userById = await _service1.getUserById(id: id);
  //   // try {
  //   //   _userById = await _service1.getUserById(id: id);
  //   // } catch (e) {
  //   //   print(e);
  //   //   print("problem printed");
  //   //   return;
  //   // // }

  //   // print(_userById.name);
  //   turnIdle();
  // }
}
