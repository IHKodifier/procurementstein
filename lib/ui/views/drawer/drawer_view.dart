import 'package:flutter/material.dart';
import 'package:procuremenstein/app/rounded_button.dart';
// import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/ui/views/drawer/drawer_viewmodel.dart';
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
    model.currentUserProfile;
    return UserAccountsDrawerHeader(
      
      currentAccountPicture: _buildAccountPicture(model),
      accountName: _buildAccountName(context, model),
      accountEmail: _buildAccountEmail(model),
    );
  }

  Padding _buildAccountPicture(DrawerViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: model.currentUserProfile['photoUrl']!=null? CircleAvatar(
        backgroundImage: NetworkImage(model.currentUserProfile['photoUrl']),
      ):null,
    );
  }

  Text _buildAccountName(BuildContext context, DrawerViewModel model) {
    return model.currentUserProfile['email']!=null? Text(
      model.currentUserProfile['email'],
      style: Theme.of(context)
          .textTheme
          .title
          .copyWith(fontSize: 18, color: Colors.white),
    ): null;
  }

  Text _buildAccountEmail(DrawerViewModel model) =>model.currentUserProfile['profileTitle']!=null?
      Text(model.currentUserProfile['profileTitle']):null;

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
      title: new Text('Roles Available  = ${model.currentUserProfile['profileType'].toString()}'),
      trailing: Icon(Icons.account_box),
      onTap: () {
        model.showDialogFeatureNotReady();
      },
    );
  }

  Padding _buildSignOut(BuildContext context, DrawerViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32),
      child: RoundedButton(
        press: () {
          model.signOut();
        },
        text: 'Sign Out',
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
