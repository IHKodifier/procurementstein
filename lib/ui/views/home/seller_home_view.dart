import 'package:flutter/material.dart';
import 'package:procuremenstein/app/rounded_button.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/ui/views/drawer/drawer_view.dart';
import 'package:procuremenstein/ui/views/home/home_viewmodel.dart';
import 'package:procuremenstein/ui/shared/input_field.dart';
import 'package:stacked/stacked.dart';

class SellerHomeView extends StatelessWidget {
  const SellerHomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (_, model, child) => Scaffold(
              appBar: AppBar(),
              drawer: AppDrawer(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child:
                            Text('You have landed at \nseller \nHome \nView')),
                    RoundedButton(
                      press: () {
                        model.signOut();
                      },
                      color: Theme.of(context).primaryColor,
                      text: 'Sign Out',
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
