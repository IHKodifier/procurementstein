import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuremenstein/bloc/user.dart';
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
    AuthenticationBloc authBloc =
        Provider.of<AuthenticationBloc>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InnerText(),
            SizedBox(height: 50,),
             RaisedButton(
            child: Text('try another user'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              List<User> users = <User>[
                User('Nasir@Heartfile.org', 'Nasir', 'Mehmood'),
                User('Kassim@Heartfile.org', 'Kassim', 'Nishtar'),
                User('Saba@Heartfile.org', 'Saba', 'Amjad'),
                User('Amjad@Heartfile.org', 'Amjad ', 'Khan'),
                User('Qadeer@Heartfile.org', 'Qadeer', 'Khan'),
                User('AAmra@Heartfile.org', 'Aamra', 'Q. Abbasi'),
                User('Uzair@Heartfile.org', 'Sardar Uzair Kan ', 'Baloch'),
              ];
              Random random = Random();

              authBloc.setAuthenticatedUser(users[random.nextInt(7)],);
            },
          ),
          ],
        ),
      ),
    );
  }
}
