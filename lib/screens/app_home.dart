import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:procuremenstein/bloc/app_user.dart';
import 'package:procuremenstein/bloc/user_management.dart';
import 'package:procuremenstein/screens/app_drawer.dart';
// import 'package:procuremenstein/widget/inner.dart';
import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:procuremenstein/shared/loding_spinner.dart';
import 'package:provider/provider.dart';

class AppHome extends StatefulWidget {
  // MyHomePage()

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authBloc = Provider.of<AuthenticationBloc>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // InnerText(),
            SizedBox(
              height: 50,
            ),
            //    RaisedButton(
            //   child: Text('try another user'),
            //   color: Theme.of(context).primaryColor,
            //   onPressed: () {
            //     List<User> users = <User>[
            //       User('Nasir@Heartfile.org', 'Nasir', 'Mehmood'),
            //       User('Kassim@Heartfile.org', 'Kassim', 'Nishtar'),
            //       User('Saba@Heartfile.org', 'Saba', 'Amjad'),
            //       User('Amjad@Heartfile.org', 'Amjad ', 'Khan'),
            //       User('Qadeer@Heartfile.org', 'Qadeer', 'Khan'),
            //       User('AAmra@Heartfile.org', 'Aamra', 'Q. Abbasi'),
            //       User('Uzair@Heartfile.org', 'Sardar Uzair Kan ', 'Baloch'),
            //     ];
            //     Random random = Random();

            //     authBloc.setAuthenticatedUser(users[random.nextInt(7)],);
            //   },
            // ),
            Text('You have logged in successfully'),
            SizedBox(height: 50),
            RaisedButton(
                child: Text('Log out'),
                onPressed: () {
                  UserManagement().handleSignOut(context);
                    // initialData: ,
                    
                 
                }),
          ],
        ),
      ),
    );
  }
}
