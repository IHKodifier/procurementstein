import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import '../models/app_user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  DialogService _dialogService = serviceLocator<DialogService>();

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    var user;
    try {
      user = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('/n/n/n/n');

      print(e.message);
      print('\n\n\n im printing IHK error message');
      print(e.message);
      return (e.message);
    }
    if (user != null) {
      print('sign in successfull');
      return (user != null);
    } else {}
  }

  Future<dynamic> signUpWithEmail({
    @required String email,
    @required String password,
    @required String nickName,
  }) async {
    var authResult;
    try {
      authResult = await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        print('\n\n\n Fireuser created \n\n\n');

        //create an [AppUser]
        await createAppUser(authResult, nickName);
        print('\n\n\n\n app user created\n\n\n');
        return authResult;
      } else
        return false;
    } catch (e) {
      _dialogService.showDialog(
        title: 'Signup Error',
        description: e.message.toString(),
      );
      print('ihk caught an exception \n\n\n\n\n\n\n');

      print(e.message);
    }
  }

  Future signout() async {
    try {
      await _firebaseAuthInstance.signOut();
      print('logged out of FireBase');
    } catch (e) {
      print(e.message);
    }
  }

  Future<bool> createAppUser(AuthResult authResult, String nickName) async {
    try {
      Firestore.instance.collection('/users').add({
        'email': authResult.user.email,
        'uid': authResult.user.uid,
        'roles': 'buyer,seller',
        'nickName': nickName,
        'createdBy': 'debugAdmin',
      }).then((value) {
        print('\n\n\n App User createdin firestore\n\n\n');
        if (value != null) {
          return true;
        } else {
          return false;
        }
      }).catchError((e) {
        print('error encountered: ${e.toString()}');
      });
    } catch (e) {
      print(e.message);
    }
  }

// }
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
