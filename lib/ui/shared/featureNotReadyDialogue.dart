import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';

Future showDialogFeatureNotReady() async {
  DialogService _dialogService = serviceLocator<DialogService>();
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
