import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return (user != null);
    } catch (e) {
      print(e.message);
      return (e.message);
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      print(e.message);
    }
  }

// AppUser _user = null;
//   AppUser get authenticatedUser => _user;

// //   Widget authenticateUser(
// //       BuildContext localcontext, String email, String password) {
//     print('printing  $email');
//     print('password $password');

//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((signedInUser) {
//       Navigator.of(localcontext).popAndPushNamed('/appHome');
//     }).catchError((e) {
//       print(e.toString());
//     });
//   }

//   createNewUser(AuthResult authResult, context) {
//     // BuildContext _context
//     Firestore.instance.collection('/users').add({
//       'email': authResult.user.email,
//       'uid': authResult.user.uid,
//       'roles': 'kiosk,doctor',
//       'createdBy': 'debugAdmin',
//     }).then((value) {
//       Navigator.of(context).pop();
//       Navigator.pushReplacementNamed(context, '/newAccountSuccess');
//     }).catchError((e) {
//       print('error encountered: ${e.toString()}');
//     });
//   }

//   Widget handleSignOut() {
//     return FutureBuilder(
//       future: FirebaseAuth.instance.signOut(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData)
//           return LoadingSpinner();
//         else
//           Navigator.of(context).popAndPushNamed('/signOutSuccess');
//       },
//     );

//     FirebaseAuth.instance.signOut();
//   }

//   // also set the internal [FireBaseUser]  for App User class
//   setAuthenticatedUser(AppUser user, FirebaseUser firebaseUser) {
//     this._user = user;
//     this._user.fireUser = firebaseUser;
//     // notifyListeners();
//   }

//   Future<bool> attemptSignIn(
//       BuildContext context, String email, String password) async {
//     AuthResult authResult = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     if (authResult == null)
//       return false;
//     else {
//       this.authenticatedUser.fireUser = authResult as FirebaseUser;
//       return true;
//     }
//   }
}
