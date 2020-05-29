import 'package:flutter/material.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/app/base_model.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';

class SignupViewModel extends BaseModel {
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

  Future<dynamic> signupWithEmil(
    String email,
    String password,
    String nickName,
  ) async {
    setBusy(true);
    try {
      var loginResult = await _authenticationService.signUpWithEmail(
          email: email, password: password, nickName: nickName);
      if (loginResult != null ) {
        //user was SUCCESSFULLY CREATED in Firbase
        setBusy(false);
        _navigationService.popAndPush('HomeViewRoute');
      } else if (loginResult==null) {
        //user was not successfully created

      } else {}
    } catch (e) {
      setBusy(false);
      print(e.toString());
    }
  }
}
