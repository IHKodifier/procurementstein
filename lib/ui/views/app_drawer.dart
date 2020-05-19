import 'dart:math';

import 'package:flutter/material.dart';
import 'package:procuremenstein/services/authentication_service.dart';
// import 'package:procuremenstein/bloc/app_user.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';

import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var authBloc = Provider.of<AuthenticationService>(context);

    // return _buildDrawer(context,authBloc);
  }

  Widget _buildDrawer(BuildContext context, var authBloc) {
    return Drawer(
      elevation: 2.0,
      child: ListView(
        children: <Widget>[
          Container(
            // the decoration below did not produce desired visual look.
            // decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(150), topLeft: Radius.circular(150)), color: Colors.white),
            child: new UserAccountsDrawerHeader(
              // colo
              // margin: EdgeInsets.all(4.0),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.all(4.0),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                ),
              ),
              accountName: new Text(authBloc.authenticatedUser.displayName,
                  style: Theme.of(context).textTheme.headline5
                  // .copyWith(fontSize: 18, color: Colors.white),
                  ),
              accountEmail: new Text(authBloc.authenticatedUser.userName,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
          ),
          new ListTile(
            title: new Text('About Page'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //         builder: (BuildContext context) => new AboutPage()));
            },
          ),
          // About page
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32),
            child: RaisedButton(
              onPressed: () {
                // UserManagement().signOut();
                Navigator.popAndPushNamed(context, '/login');
              },
              child: Text('Sign Out'),
              color: Theme.of(context).primaryColor,
            ),
          ),
          //login button
          RaisedButton(
            child: Text('try another user'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
            
            },
          ),
        ],
      ),
    );
  }
}
