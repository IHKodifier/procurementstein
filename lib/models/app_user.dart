import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  FirebaseUser _fireUser;
  String _firstName;
  String _lastName;
  String _photourl;

  String get firstName => _firstName;
  FirebaseUser get fireUser => this._fireUser;
  String get lastName => _lastName;
  String get photoUrl => _photourl;

  String get displayName {
    return '$_firstName.i $_lastName';
  }

  // String get lastSignIn => _lastSignedIn;

  AppUser();
  AppUser.fromFireUser(this._fireUser);

  AppUser.fromFireUserAndNamedArgs(this._fireUser,this._firstName,this._lastName , this._photourl,);


}
