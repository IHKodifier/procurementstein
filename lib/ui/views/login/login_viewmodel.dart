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
import 'package:procuremenstein/ui/views/home/home_view.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';

class LoginViewModel extends BaseModel {
  //all services needed
  final AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  final DialogService _dialogService = serviceLocator<DialogService>();
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  getCurrentUser() => _authenticationService.getCurrentUser();

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

  Widget handleStartupLogin({
    BuildContext context,
    // {context,
    LoginViewModel model,
    Widget childWhenAuthetnticated,
    Widget childWhenNotAuthenticated,
  }) {
    setBusy(true);
    return StreamBuilder(
        stream: _authenticationService.authenticationStateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setBusy(false);
            //todo set global userProfile
            _authenticationService.setAuthenticatedUser(snapshot.data.uid);
            return childWhenAuthetnticated;
          } else {
            setBusy(false);
            return childWhenNotAuthenticated;
          }
        });

    return StreamBuilder(
      stream: _authenticationService.authenticationStateStream,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          model.setCurrentUser(snapshot.data.uid);
          notifyListeners();
          return Container(
            height: 0,
            width: 0,
          );
        } else {
          model.nullifyCurrentUser();
          notifyListeners();
          return Container(
            height: 0,
            width: 0,
          );
        }
      },
    );
  }

  //set the global currentUser in [AuthenticationService]
  Future setCurrentUser(String uid) async {
    return await _authenticationService.setAuthenticatedUser(uid);
  }

  void nullifyCurrentUser() {
    _authenticationService.currentUserProfile = null;
    notifyListeners();
  }
}
