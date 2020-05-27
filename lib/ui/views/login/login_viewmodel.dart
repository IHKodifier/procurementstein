import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procuremenstein/app/route_paths.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';

import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/app/base_model.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  final DialogService _dialogService = serviceLocator<DialogService>();
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
// var authResult = AuthResult
    if (result is bool) {
      if (result) {
        _navigationService.navigateTo('HomeViewRoute');
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'Couldn\'t login at this moment. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignup() {
    _navigationService.navigateTo(routes.SignUPViewRoute);
  }
}
