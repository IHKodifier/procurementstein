import 'package:procuremenstein/app/service_locator.dart';
// import 'package:procuremenstein/models/app_user.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;

class HomeViewModel extends BaseViewModel {
  AuthenticationService _authenticationService =
      serviceLocator<AuthenticationService>();
  NavigationService _navigationService = serviceLocator<NavigationService>();
  DialogService _dialogService = serviceLocator<DialogService>();
  // AppUser _currenrUser = _authenticationService.currentUser();

  void signOut() {
    _authenticationService.signout();
    _navigationService.navigateTo(routes.LoginRoute);
  }
Future showDialog() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Loggin Successfull',
      description: 'FilledStacks architecture rocks',
    );
    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }


  String _title = 'Home View';
  String get title => _title;
}
