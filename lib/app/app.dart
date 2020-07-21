import 'package:flutter/material.dart';
import 'package:procuremenstein/managers/dialog_manager.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;
import 'package:procuremenstein/services/router.dart' as router;
import 'package:procuremenstein/app/constants.dart' as constants;

import 'package:procuremenstein/app/service_locator.dart';

class App extends StatelessWidget {
  ThemeData _buildTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: constants.appPrimaryColor,
      primaryColorLight: constants.appPrimaryLightColor,
      buttonColor: Theme.of(context).primaryColor,
      accentColor: constants.appAccentColor,

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'procuremenStein',
      theme: _buildTheme(context),
      //builder below is need to ensure dialoge service stays at the top of widget tree
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
                  child: widget,
                )),
      ),
      //TODO FIX THIS
      onGenerateRoute: router.generateRoute,
      navigatorKey: serviceLocator<NavigationService>().navigationKey,
      initialRoute: routes.StartupRoute,
    );
  }
}
