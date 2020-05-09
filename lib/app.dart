import 'package:flutter/material.dart';
import 'package:procuremenstein/screens/app_home.dart';
import 'package:procuremenstein/bloc/authentication_bloc.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationBloc>.value(
          value : AuthenticationBloc(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'procuremenStein-Stein',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // brightness: Brightness.dark
        ),
        home: MyHomePage(),
      ),
    );
  }
}
