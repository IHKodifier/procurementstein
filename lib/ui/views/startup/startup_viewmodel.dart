import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  String _modelname = 'StartupViewModel';
  String get modelName => _modelname;
  String _tempstr;

  set inputString(str) {
    _tempstr = str;
    notifyListeners();
  }

  String get inputString => _tempstr;
}
