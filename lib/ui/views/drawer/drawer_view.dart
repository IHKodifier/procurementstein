import 'dart:math';

import 'package:flutter/material.dart';
import 'package:procuremenstein/services/authentication_service.dart';
// import 'package:procuremenstein/bloc/app_user.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';

import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            // colo
            // margin: EdgeInsets.all(4.0),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.all(4.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            accountName: new Text(
              'Asad Nouman Durrani ',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 18, color: Colors.white),
            ),
            accountEmail: new Text('Kiosk579@Tahafuz.com.pk'),
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
        ],
      ),
    );
  }
}
