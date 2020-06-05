import 'package:firebase_auth/firebase_auth.dart';
import 'package:procuremenstein/app/service_locator.dart';
// import 'package:procuremenstein/models/app_user.dart';
import 'package:procuremenstein/services/authentication_service.dart';
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
    return _authenticationService.currentUser;
    notifyListeners();
  }

  Future showDialogFeatureNotReady() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Feature not ready yet!!',
      description: 'Come back some time later to enjoy this feature',
    );
    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }

  void signOut() {
    _authenticationService.signout();
    _navigationService.navigateTo(routes.LoginRoute);
    // FirebaseUser fireuser;
    // fireuser.uid
  }
}
