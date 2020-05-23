import 'package:procuremenstein/ui/views/home/home_view.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
      break;
    case routes.HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}

// @MaterialAutoRouter()
// class $Router {
//   @initial
//   LoginView startupViewRoute;
//   HomeView homeViewRoute;
//}
