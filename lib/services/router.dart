import 'package:procuremenstein/ui/views/home/home_view.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';
import 'package:procuremenstein/app/route_paths.dart' as routes;
import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/views/login/new_account_success.dart';
import 'package:procuremenstein/ui/views/signup/signup_view.dart';
import 'package:procuremenstein/ui/views/startup/startup_view.dart';
import 'package:procuremenstein/ui/views/welcome/welcome_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
      break;
    case routes.HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
      break;
    case routes.SignUPViewRoute:
      return MaterialPageRoute(builder: (context) => SignupView());
      break;
    case routes.NewAccountSuccessRoute:
      return MaterialPageRoute(builder: (context) => NewAccountSuccess());
      break;
    case routes.StartupRoute:
      return MaterialPageRoute(builder: (context) => StartupView());
      break;
    case routes.WelcomeRoute:
      return MaterialPageRoute(builder: (context) => WelcomeView());
      break;
      
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
