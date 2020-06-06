import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuremenstein/ui/shared/busy_overlay.dart';
import 'package:procuremenstein/ui/shared/loding_spinner.dart';
import 'package:procuremenstein/ui/views/login/login_viewmodel.dart';
import 'package:procuremenstein/ui/views/login/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  BuildContext _localContext;
  @override
  Widget build(BuildContext context) {
    this._localContext = context;
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => _buildScaffold(context, model));
  }

  Widget _buildScaffold(BuildContext context, LoginViewModel model) {
    return BusyOverlay(
      show: model.isBusy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(child: _buildHellostack()),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      _buildEmailTextField(context),
                      SizedBox(height: 20.0),
                      buildPasswordTextField(context),
                      SizedBox(height: 5.0),
                      buildForgotPassword(),
                      SizedBox(height: 40.0),
                      buildLoginButton(model),
                      SizedBox(height: 15.0),
                      _buildLoginWithFacebook(model),
                      SizedBox(height: 10.0),
                      _buildLoginWithGoogle(model),
                    ],
                  )),
              SizedBox(height: 15.0),
              _buildNeedToSignUpRow(context, model),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildHellostack() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
          child: Text('Hello',
              style: TextStyle(
                  fontFamily: GoogleFonts.cabin().toString(),
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
          child: Text('There',
              style: TextStyle(
                  fontFamily: GoogleFonts.cabin().toString(),
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(225.0, 155.0, 0.0, 0.0),
          child: Text('.',
              style: TextStyle(
                  fontFamily: GoogleFonts.cabin().toString(),
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(_localContext).primaryColor)),
        )
      ],
    );
  }

  Row _buildNeedToSignUpRow(BuildContext context, LoginViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'New to ProcuremenStein ?',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        SizedBox(width: 5.0),
        InkWell(
          onTap: () {
            model.navigateToSignup();
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: Theme.of(this._localContext).primaryColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  Container buildLoginButton(LoginViewModel model) {
    return Container(
      height: 40.0,
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.orangeAccent,
        color: Theme.of(_localContext).primaryColor,
        elevation: 7.0,
        child: RaisedButton(
          color: Theme.of(_localContext).primaryColor,
          onPressed: () {
            model.setBusy(true);
            model.loginWithEmail(
                email: _emailController.text,
                password: _passwordController.text);
          },
          child: model.isBusy
              ? LoadingSpinner()
              : Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
        ),
      ),
    );
  }

  Container buildForgotPassword() {
    return Container(
      alignment: Alignment(1.0, 0.0),
      padding: EdgeInsets.only(top: 15.0, left: 20.0),
      child: InkWell(
        child: Text(
          'Forgot Password',
          style: TextStyle(
              color: Theme.of(_localContext).primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  TextField buildPasswordTextField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      obscureText: true,
    );
  }

  TextField _buildEmailTextField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'EMAIL',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }

  GestureDetector _buildLoginWithFacebook(LoginViewModel model) {
    return GestureDetector(
      onTap: () {
        model.showDialogFeatureNotReady();
      },
      child: Container(
        height: 40.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ImageIcon(AssetImage('assets/images/facebook.png')),
              ),
              SizedBox(width: 10.0),
              Center(
                child: Text('Log in with facebook',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildLoginWithGoogle(LoginViewModel model) {
    return Container(
        height: 40.0,
        // color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1.0),
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ImageIcon(
                  AssetImage('assets/images/google.png'),
                  // size:50,
                  // fit:
                ),
              ),
              SizedBox(width: 10.0),
              Center(
                child: Text('Log in with Google',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
              ),
            ],
            // ],
          ),
        ));
  }
}
