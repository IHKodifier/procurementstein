import 'package:get_it/get_it.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/services/dialog_service.dart';

final GetIt serviceLocator = GetIt.instance;

void registerAllServicesWithLocator() {

  // TODO:  register all services here as [preferabbly lazy] singletons
  serviceLocator.registerLazySingleton(() => NavigationService());
  serviceLocator.registerLazySingleton(() => DialogService());
  serviceLocator.registerLazySingleton(() => AuthenticationService());
}
