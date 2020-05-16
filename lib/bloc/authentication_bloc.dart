import 'package:flutter/material.dart';
import 'package:procuremenstein/bloc/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationBloc extends ChangeNotifier {
  //the currently logged in [AppUser]
  AppUser _user = AppUser();
  AppUser get authenticatedUser => _user;

AuthenticateUser(){
  
}

  //set AuthenticatedUser Across the app

  // also set the internal [FireBaseUser]  for App User class
  setAuthenticatedUser(AppUser user, FirebaseUser firebaseUser) {
    this._user = user;
    this._user.fireUser = firebaseUser;
    notifyListeners();
  }
}
