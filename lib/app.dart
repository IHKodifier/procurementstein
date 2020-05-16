import 'package:flutter/material.dart';
import 'package:procuremenstein/bloc/user_management.dart';
import 'package:procuremenstein/screens/app_home.dart';
import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:procuremenstein/screens/login_page.dart';
import 'package:procuremenstein/screens/new_account_success.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'procuremenStein',
        routes: <String, WidgetBuilder>{
          '/appHome': (_) => AppHome(),
          '/login': (_) => LoginPage(),
          '/newAccountSuccess': (BuildContext context) => NewAccountSuccess(),
        },
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // brightness: Brightness.dark
        ),
        home: UserManagement().handleAuth(),
      ),
    );
  }
}
