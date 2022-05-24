import 'package:firebase_auth/firebase_auth.dart';

import '../../app/dependencies.dart';
import '../rest.dart';

class AuthServiceFirebase {
  RestService get rest => dependency();
  final FirebaseAuth _firebaseAuth;
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  AuthServiceFirebase(this._firebaseAuth);
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
