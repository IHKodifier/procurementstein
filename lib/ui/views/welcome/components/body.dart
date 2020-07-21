import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:procuremenstein/app/rounded_button.dart';
import 'package:procuremenstein/ui/views/login/login_view.dart';
import 'package:procuremenstein/ui/views/signup/signup_view.dart';
import 'package:procuremenstein/ui/views/welcome/components/background.dart';
import 'package:procuremenstein/app/constants.dart' as constants;

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO B2B EXPRESS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your one stop for Business to Business',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    '  Procurements',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.04),
            RoundedButton(
              color: constants.appPrimaryColor,
              text: "LOGIN",
              press: () {
                // todo use navigation service
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginView();
                    },
                  ),
                );
                
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              // todo replace with theme based color
              color: constants.appPrimaryLightColor,
              textColor: constants.appPrimaryColor,
              // Colors.black,
              press: () {
                // todo use navigation service
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupView();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('powered by',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontStyle: FontStyle.italic
                          )),
                  Text('  EnigmaTek Inc.',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontStyle: FontStyle.italic
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
