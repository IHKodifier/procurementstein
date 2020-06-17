import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import '../models/app_user.dart';
import 'package:procuremenstein/services/console_utility.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  DialogService _dialogService = serviceLocator<DialogService>();
  dynamic currentUserProfile;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    var authResult;
    try {
      authResult = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      ConsoleUtility.printToConsole(e.message);

      return (e.message);
    }

    if (authResult != null) {
      ConsoleUtility.printToConsole('sign in successfull');
      //get the user from [users] collection firestore &
      //set the logged in user as current user across the app
      setCurrentUser(authResult.user.uid);

      return (authResult != null);
    } else {}
  }

  Future<QuerySnapshot> getFireStoreUser(String uid) async {
    return Firestore.instance
        .collection('/userProfiles')
        .where('uid', isEqualTo: uid)
        .getDocuments();
  }

  Future<bool> setCurrentUser(String uid) async {
    try {
      var returnvalue = await getFireStoreUser(uid);
      currentUserProfile = returnvalue.documents[0].data;
    } catch (e) {
      _dialogService.showDialog(title: e.message);
      return false;
    }
    return true;
  }

  Future<dynamic> signUpWithEmail({
    @required String email,
    @required String password,
    @required var userData,
  }) async {
    var authResult;
    try {
      authResult = await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        ConsoleUtility.printToConsole(
            ' Fireuser created \n\n user id = ${authResult.user.uid}');

        //create an [AppUser]
        var createResult = await createAppUser(authResult, userData);
        if (createResult != null) {
          ConsoleUtility.printToConsole(' app user created');
          ConsoleUtility.printToConsole(createResult.toString());
          return authResult;
        }
      } else
        return false;
    } catch (e) {
      _dialogService.showDialog(
        title: 'Signup Error',
        description: e.message.toString(),
      );
      ConsoleUtility.printToConsole(' ihk caught an exception \n${e.message}');
    }
  }

  Future signout() async {
    try {
      await _firebaseAuthInstance.signOut();
      ConsoleUtility.printToConsole('logged out of FireBase');
    } catch (e) {
      ConsoleUtility.printToConsole(e.message);
    }
  }

//create all user profile data here to save to [userProfiles] collection
  _buildUserProfileMap(AuthResult authResult, var userProfileData) {
    userProfileData['email'] = authResult.user.email;
    userProfileData['uid'] = authResult.user.uid;
    userProfileData['creeatedBy'] = 'debugAdmin';
    userProfileData['version'] = 'ViewModelBuiler2.2';
    userProfileData['photoUrl'] = 'http://i.pravatar.cc/300';
  }

  Future<bool> createAppUser(AuthResult authResult, var userProfileData) async {
    _buildUserProfileMap(authResult, userProfileData);
    try {
      Firestore.instance
          .collection('/userProfiles')
          .add(userProfileData)
          .then((value) {
        ConsoleUtility.printToConsole(' UserProfile  created in firestore');
        if (value != null) {
          return true;
        } else {
          return false;
        }
      }).catchError((e) {
        ConsoleUtility.printToConsole('error encountered: ${e.toString()}');
      });
    } catch (e) {
      ConsoleUtility.printToConsole(e.message);
    }
  }
}
