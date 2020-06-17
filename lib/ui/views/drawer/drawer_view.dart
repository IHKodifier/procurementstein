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
            _buildBuildProfile(model),
            Divider(),
            _buildSettingsTile(model),
            Divider(),
            _buildAboutTile(model),
            Divider(),
            _buildProfileTypeTile(model),
            Divider(),
            _buildSignOut(context, model),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader(
      BuildContext context, DrawerViewModel model) {
    model.currentUser;
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
        backgroundImage: NetworkImage(model.currentUser['photoUrl']),
      ),
    );
  }

  Text _buildAccountName(BuildContext context, DrawerViewModel model) {
    return new Text(
      model.currentUser['email'],
      style: Theme.of(context)
          .textTheme
          .title
          .copyWith(fontSize: 18, color: Colors.white),
    );
  }

  Text _buildAccountEmail(DrawerViewModel model) =>
      Text(model.currentUser['profileTitle']);

  ListTile _buildAboutTile(DrawerViewModel model) {
    return new ListTile(
      title: new Text('About this app'),
      onTap: () {
        model.showDialogFeatureNotReady();
      },
    );
  }

  ListTile _buildBuildProfile(DrawerViewModel model) {
    return new ListTile(
      title: new Text('Profile'),
      trailing: Icon(Icons.edit),
      onTap: () {
        model.showDialogFeatureNotReady();
      },
    );
  }

  ListTile _buildSettingsTile(DrawerViewModel model) {
    return new ListTile(
      title: new Text('Settings'),
      trailing: Icon(Icons.settings),
      onTap: () {
        model.showDialogFeatureNotReady();
      },
    );
  }

  ListTile _buildProfileTypeTile(DrawerViewModel model) {
    return new ListTile(
      title: new Text('Profile Type = ${model.currentUser['profileType']}'),
      trailing: Icon(Icons.account_box),
      onTap: () {
        model.showDialogFeatureNotReady();
      },
    );
  }

  Padding _buildSignOut(BuildContext context, DrawerViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32),
      child: RaisedButton(
        onPressed: () {
          model.signOut();
        },
        child: Text('Sign Out'),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
