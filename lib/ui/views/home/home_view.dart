import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/views/drawer/drawer_view.dart';
import 'package:procuremenstein/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model)=>model.getDefaultHomeforUser(),
        builder: (_, model, child) => Scaffold(
              // appBar: AppBar(),
              // drawer: AppDrawer(),
              body: model.getDefaultHomeforUser(),     
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
