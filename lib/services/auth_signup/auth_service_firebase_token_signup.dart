import '../../app/dependencies.dart';
import '../../models/user.dart' as user;
import '../rest.dart';
import 'auth_service_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServiceSignupFirebaseToken implements AuthServiceSignup {
  RestService get rest => dependency();

  CollectionReference addUser = FirebaseFirestore.instance.collection('users');
  void _storeNewFirebaseUser(
      uid, name, email, password, phoneNo, yearBorn) async {
    print("inside store");
    await addUser
        .doc(uid)
        .set({
          'id': uid,
          'name': name,
          'email': email,
          'password': password,
          'phoneNo': phoneNo,
          'yearBorn': yearBorn
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<user.User> signUp(
      {String name,
      String phoneNo,
      String yearBorn,
      String email,
      String password}) async {
    try {
      print(email);
      //print("start singup here");
      final json = await rest.post('auths/signup', data: {
        'email': email,
        'password': password,
      });

      if (json == null) return null;

      // Pre-process json data to comply with the field of the User model
      json['email'] = json['email'];
      json['id'] = json['localId'];
      json['name'] = json['displayName'];
      //json['photoUrl'] = json['profilePicture'];

      _storeNewFirebaseUser(
          json['localId'], name, json['email'], password, phoneNo, yearBorn);
      // Get the access token and let the rest object stores that
      //rest.openSession(json['idToken']);
      rest.closeSession();

      final _user = user.User.fromJson(json);
      return _user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async => rest.closeSession();
}
