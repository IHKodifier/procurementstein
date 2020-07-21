import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:procuremenstein/app/rounded_button.dart';
// import 'package:procuremenstein/app/rounded_input_field.dart' as inputField;
import 'package:procuremenstein/app/rounded_input_field.dart';
import 'package:procuremenstein/app/rounded_password_field.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/services/authentication_service.dart';
import 'package:procuremenstein/services/navigation_service.dart';
import 'package:procuremenstein/ui/views/login/already_have_an_account.dart';
import 'package:procuremenstein/ui/views/login/components/background.dart';
// import 'package:flutter/material.dart';

class Body extends StatelessWidget {
   Body({
    Key key,
  }) : super(key: key);
  final AuthenticationService authenticationService =
      serviceLocator<AuthenticationService>();
  final NavigationService navigationService =
      serviceLocator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              color: Theme.of(context).primaryColor,
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
