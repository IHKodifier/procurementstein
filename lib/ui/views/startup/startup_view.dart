import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/views/home/home_viewmodel.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';
import 'package:procuremenstein/ui/views/startup/startup_viewmodel.dart';
import 'package:procuremenstein/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return ViewModelBuilder<StartupViewModel>.reactive(
        builder: (_, model, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have landed at \n ${model.modelName}'),
                    RaisedButton(
                      onPressed: () {
                        // model.inputString = controller.text;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginView()));
                      },
                      child: Text('Log out'),
                    ),
                    InputField(
                      controller: controller,
                      placeholder: null,
                      enterPressed: () {
                        model.inputString = controller.text;
                      },
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => StartupViewModel());
  }
}
