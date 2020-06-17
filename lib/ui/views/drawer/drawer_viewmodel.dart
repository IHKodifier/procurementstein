import 'package:firebase_auth/firebase_auth.dart';
import 'package:procuremenstein/app/service_locator.dart';
// import 'package:procuremenstein/models/app_user.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;

class DrawerViewModel extends BaseViewModel {
//services

  AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  NavigationService _navigationService = serviceLocator<NavigationService>();
  DialogService _dialogService = serviceLocator<DialogService>();

  dynamic get currentUser {
    return _authenticationService.currentUserProfile;
    notifyListeners();
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

  void signOut() {
    _authenticationService.signout();
    _navigationService.navigateTo(routes.LoginRoute);
    // FirebaseUser fireuser;
    // fireuser.uid
  }
}
