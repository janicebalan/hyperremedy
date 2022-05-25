import '../models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  final _session = Session();

  Future<String> getToken() async {
    // If the token has not set yet, then load the cached one
    if (_session.token == null) {
      // if cached token exists
      // load cached token from SharedPreference / Flutter session

    }
    return _session.token;
  }

  Future<void> setToken(String token, String id) async {
    if (token == null) {
      // if cached token exists
      // Delete the file
    } else {
      // write the token to sharedpreference
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('id', id);
    }

    _session.token = token;
  }
}
