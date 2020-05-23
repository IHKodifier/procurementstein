import 'package:flutter/material.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;
import 'package:procuremenstein/services/router.dart' as router;


import 'package:procuremenstein/app/service_locator.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'procuremenStein',
        theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
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