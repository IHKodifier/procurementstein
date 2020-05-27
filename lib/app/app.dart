import 'package:flutter/material.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;
import 'package:procuremenstein/services/router.dart' as router;

import 'package:procuremenstein/app/service_locator.dart';

class App extends StatelessWidget {
  ThemeData _buildTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: Colors.orange,
      buttonColor: Theme.of(context).primaryColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            buttonColor: Theme.of(context).primaryColor,
            height: 40,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'procuremenStein',
      theme: _buildTheme(context),
      //TODO FIX THIS
      onGenerateRoute: router.generateRoute,
      navigatorKey: serviceLocator<NavigationService>().navigationKey,
      initialRoute: routes.LoginRoute,
    );
    // );
  }
}

//routes
// routes: <String, WidgetBuilder>{
//   '/appHome': (_) => AppHome(),
//   '/login': (_) => LoginPage(),
//   '/signOutSuccess': (_) => SignoutSuccess(),
//   '/newAccountSuccess': (BuildContext context) => NewAccountSuccess(),
// },
