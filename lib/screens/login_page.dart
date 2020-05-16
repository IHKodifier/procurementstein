import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:procuremenstein/bloc/user_management.dart';
import 'package:procuremenstein/shared/loding_spinner.dart';

class LoginPage extends StatefulWidget {
  // bool retryLogin=false;

  LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return isLoading
        ? LoadingSpinner()
        : Scaffold(
            // backgroundColor: Theme.of(context).colorScheme.onPrimary,
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        // child: PhilanthroctorLogo(),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _emailTextField(localTheme),
                      _passwordTextField(localTheme),
                      SizedBox(height: 30.0),
                      _loginButton(localTheme, context),
                      SizedBox(height: 35.0),
                      Text('Don\'t have an account?',
                          style: localTheme.textTheme.display1
                              .copyWith(fontSize: 26.0)),
                      SizedBox(height: 20.0),
                      _signupButton(context, localTheme),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Container _signupButton(BuildContext context, ThemeData localTheme) {
    return Container(
      width: 260,
      height: 45.0,
      padding: EdgeInsets.symmetric(
        horizontal: 2,
      ),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text(
          'SIGN UP ',
          style: localTheme.textTheme.button.copyWith(fontSize: 20.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/signup');
        },
      ),
    );
  }

  Container _loginButton(ThemeData localTheme, BuildContext context) {
    return Container(
      width: 260,
      height: 45.0,
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: RaisedButton(
          child: Text(
            '(hardcoded) LOGIN',
            style: localTheme.textTheme.button
                .copyWith(color: Colors.white, fontSize: 20.0),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() => isLoading = true);
            FirebaseAuth.instance
                .signInWithEmailAndPassword(email: 'Nasir@Heartfile.org', password: '123456')
                // signInWithEmailAndPassword(email: _email, password: _password)
                .then((signedInUser) {
              // setState(() => isLoading = false);
              //  Navigator.of(context).popAndPushNamed('/appHome');

              // UserManagement().handleAuth();
            }).catchError((onError) {
              // setState(() => isLoading = false);
              // Navigator.of(context).pushReplacementNamed('/retryLogin');
            });
          }),
    );
  }

  Padding _passwordTextField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        style: GoogleFonts.raleway(color: Colors.black, fontSize: 22),
        decoration: InputDecoration(
          border: localTheme.inputDecorationTheme.border,
          hintText: ' alWayS CASE sENsItivE!!',
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
          labelText: 'Password',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
        ),
        obscureText: true,
        onChanged: (value) {
          _password = value.toString().trim();
        },
      ),
    );
  }

  Padding _emailTextField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        style: GoogleFonts.raleway(color: Colors.black, fontSize: 22),
        decoration: InputDecoration(
          hintText: 'email used to create ProcuremenStein account',
          labelText: 'Email',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
        onChanged: (value) {
          _email = value.toString().trim();
        },
      ),
    );
  }
}
