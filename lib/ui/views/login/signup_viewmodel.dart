import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/app/base_model.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';

class SignupViewModel extends BaseModel {
  //services
  final AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  final DialogService _dialogService = serviceLocator<DialogService>();
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  //captures the state of toggle buttons
  List<bool> roleSelectionValues = [false, false];

  //role handling
  String selectedRole;
  List<String> roles = ['Buyer', 'Seller'];
//user info and profile data
  Map<String, dynamic> userData;

  //set value of [togglebuttonat] at index
  void setToggleButtonSelectionValueAt(bool value, int index) {
    resetAllToggleButtons();
    roleSelectionValues[index] = value;
    selectedRole = roles[index];
    notifyListeners();
  }

//reset all togglebuttons to false
  void resetAllToggleButtons() {
    for (int i = 0; i < roleSelectionValues.length; i++) {
      roleSelectionValues[i] = false;
    }
  }

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
    var userData,
  ) async {
    setBusy(true);
    userData['profileType'] = selectedRole;
    try {
      var loginResult = await _authenticationService.signUpWithEmail(
          email: email, password: password, userData: userData);
      setBusy(false);

      if (loginResult != null) {
        
        //user was SUCCESSFULLY CREATED in Firbase
        _navigationService.popAndPush('HomeViewRoute');
      } else if (loginResult == null) {
        //user was not successfully created

      } else {
        setBusy(false);
      }
    } catch (e) {
      setBusy(false);
      ConsoleUtility.printToConsole(e.toString());
    }
  }
}
