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
  dynamic currentUser;

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
      print('/n/n/n/n');
      print(e.message);
      print('\n\n\n im printing IHK error message');
      print(e.message);
      return (e.message);
    }

    if (authResult != null) {
      print('sign in successfull');
      //get the user from [users] collection firestore

      var returnvalue =await  getFireStoreUser(authResult.user.uid);
  
      //set the logged in user as current user across the app
      currentUser = returnvalue.documents[0].data;
      return (authResult != null);
    } else {}
  }

  Future<QuerySnapshot> getFireStoreUser(String uid) async {
    return Firestore.instance
        .collection('/users')
        .where('uid', isEqualTo: uid)
        .getDocuments();
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
        print('\n\n\n Fireuser created \n\n\n');

        //create an [AppUser]
        await createAppUser(authResult, userData);
        print('\n\n\n\n app user created\n\n\n');
        return authResult;
      } else
        return false;
    } catch (e) {
      _dialogService.showDialog(
        title: 'Signup Error',
        description: e.message.toString(),
      );
      print('\t \t ihk caught an exception \n\n\n\n\n\n\n');

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

//create all user profile data  here to save to users collection
  _buildUserMap(AuthResult authResult, var userData) {
    userData['email'] = authResult.user.email;
    userData['uid'] = authResult.user.uid;
    userData['creeatedBy'] = 'debugAdmin';
    userData['version'] = 'ViewModelBuiler2.2';
    userData['photoUrl'] = 'http://i.pravatar.cc/300';
  }

  Future<bool> createAppUser(AuthResult authResult, var userData) async {
    _buildUserMap(authResult, userData);
    try {
      Firestore.instance.collection('/users').add(userData).then((value) {
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
}
