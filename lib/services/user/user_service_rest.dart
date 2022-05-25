import 'package:hyperremedy/app/dependencies.dart';
import 'package:hyperremedy/services/rest.dart';
import 'package:hyperremedy/services/user/user_service.dart';

import '../../models/user.dart';

class UserServiceRest implements UserService {
  RestService get rest => dependency();

  Future<User> getUserById({dynamic id}) async {
    print("doing in service rest");
    final List json = await rest.get('users?id=$id');
    print("json");
    if (json.length == 0) {
      return null;
    } else {
      //print(json);
      return User.fromJson(json[0]);
    }
  }
}
