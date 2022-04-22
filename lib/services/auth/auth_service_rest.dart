import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceRest implements AuthService {
  RestService get rest => dependency();

  Future<User> authenticate({String email, String password}) async {
    final List json = await rest.get('users?email=$email&&password=$password');

    if (json.length == 0) {
      return null;
    } else {
      //print(json);
      return User.fromJson(json[0]);
    }

    // if (json == null || json.length == 0) return null;

    // final _user = User.fromJson(json[0]);
    // print(_user);
    // return _user;
  }
}
