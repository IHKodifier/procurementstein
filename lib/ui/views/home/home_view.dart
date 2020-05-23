import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/views/home/home_viewmodel.dart';
import 'package:procuremenstein/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (_, model, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have landed at ${model.title}'),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Log out'),
                    ),
                    // InputField(controller: controller, placeholder: null),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
