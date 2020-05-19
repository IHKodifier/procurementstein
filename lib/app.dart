import 'package:flutter/material.dart';
import 'package:procuremenstein/services/dialog_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/ui/router.dart';
import 'package:procuremenstein/ui/views/login_view.dart';
import 'package:procuremenstein/ui/views/signup_view.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'procuremenStein',
                        

        builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
        home: LoginView(),
        onGenerateRoute: generateRoute,
        
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