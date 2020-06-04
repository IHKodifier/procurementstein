import 'package:flutter/material.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/ui/views/drawer/drawer_viewmodel.dart';
// import 'package:procuremenstein/bloc/app_user.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';

import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DrawerViewModel(),
      builder: (context, model, child) => Drawer(
        elevation: 2.0,
        child: ListView(
          children: <Widget>[
            _buildUserAccountsDrawerHeader(context, model),
            _buildAboutTile(),
            _buildSignOut(context),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader(
      BuildContext context, DrawerViewModel model) {
    return new UserAccountsDrawerHeader(
      // colo
      // margin: EdgeInsets.all(4.0),
      currentAccountPicture: _buildAccountPicture(model),
      accountName: _buildAccountName(context, model),
      accountEmail: _buildAccountEmail(model),
    );
  }

  Padding _buildAccountPicture(DrawerViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: new CircleAvatar(
        backgroundImage: new NetworkImage('http://i.pravatar.cc/306'),
      ),
    );
  }

  Text _buildAccountName(BuildContext context, DrawerViewModel model) {
    return new Text(
      'Asad Nouman Durrani ',
      style: Theme.of(context)
          .textTheme
          .title
          .copyWith(fontSize: 18, color: Colors.white),
    );
  }

  Text _buildAccountEmail(DrawerViewModel model) =>
      Text(model.currentUser.user.email);

  ListTile _buildAboutTile() {
    return new ListTile(
      title: new Text('About Page'),
      onTap: () {
        // Navigator.of(context).pop();
        // Navigator.push(
        //     context,
        //     new MaterialPageRoute(
        //         builder: (BuildContext context) => new AboutPage()));
      },
    );
  }

  Padding _buildSignOut(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32),
      child: RaisedButton(
        onPressed: () {
          // UserManagement().signOut();
          Navigator.popAndPushNamed(context, '/login');
        },
        child: Text('Sign Out'),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
