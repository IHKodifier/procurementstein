import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String _userid;
  String _firstName;
  String _lastName;
  // String _lastSignedIn = DateTime.now().toString();
  // String _lastmodified = DateTime.now().toString();
  FirebaseUser fireUser;

  String get userName => _userid;
  String get firstName => _firstName;
  

  String get displayName {
    return '$_firstName $_lastName';
  }

  String get lastName => _lastName;
  // String get lastSignIn => _lastSignedIn;

  AppUser();
  AppUser.fromFireUser(this.fireUser);
}
