import 'package:get_it/get_it.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //TODO:  register all services here
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}
