import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuremenstein/screens/app_drawer.dart';
import 'package:procuremenstein/widget/inner.dart';
import 'package:procuremenstein/bloc/authentication_bloc.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage()

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc =
        Provider.of<AuthenticationBloc>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InnerText(),
          ],
        ),
      ),
    );
  }
}
