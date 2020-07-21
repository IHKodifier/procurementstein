import 'package:flutter/material.dart';
import 'package:procuremenstein/app/service_locator.dart';
// import 'package:procuremenstein/models/app_user.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/ui/views/home/buyer_home_view.dart';
import 'package:procuremenstein/ui/views/home/seller_home_view.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;

class HomeViewModel extends BaseViewModel {
  AuthenticationService _authenticationService = serviceLocator<AuthenticationService>();
  NavigationService _navigationService = serviceLocator<NavigationService>();
  DialogService _dialogService = serviceLocator<DialogService>();

  void signOut() {
    _authenticationService.signout();
    _navigationService.navigateTo(routes.LoginRoute);
  }

  Future showDialog() async {
    ConsoleUtility.printToConsole('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Loggin Successfull',
      description: 'FilledStacks architecture rocks',
    );
    if (dialogResult.confirmed) {
      ConsoleUtility.printToConsole('User has confirmed');
    } else {
      ConsoleUtility.printToConsole('User cancelled the dialog');
    }
  }

  Widget getDefaultHomeforUser() {
    ConsoleUtility.printToConsole(
        'defaultRole= ${_authenticationService.defaultRole}');

    switch (_authenticationService.defaultRole) {
      case 'Buyer':
        ConsoleUtility.printToConsole('returning BuyerHomeView ');
        return BuyerHomeView();
        break;
      case 'Seller':
        ConsoleUtility.printToConsole('returning SellerHomeView ');
        return SellerHomeView();
        break;
      default:
        return LoginView();
    }
  }

  String _title = 'Home View Widget';
  String get title => _title;
}
