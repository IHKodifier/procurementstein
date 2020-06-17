import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procuremenstein/app/route_paths.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';

import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/app/base_model.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;

class LoginViewModel extends BaseModel {
  //all services needed
  final AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  final DialogService _dialogService = serviceLocator<DialogService>();
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

//attempts to login a user into app , returns a [true] if successfull or [false] otherwise
  Future loginWithEmail(
      {@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.popAndPush('HomeViewRoute');
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
 
 Future showDialogFeatureNotReady() async {
    ConsoleUtility.printToConsole('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Feature not ready yet!!',
      description: 'Come back some time later to enjoy this feature',
    );
    if (dialogResult.confirmed) {
      ConsoleUtility.printToConsole('User has confirmed');
    } else {
      ConsoleUtility.printToConsole('User cancelled the dialog');
    }
  }
 
  void navigateToSignup() {
    _navigationService.navigateTo(routes.SignUPViewRoute);
  }
}
