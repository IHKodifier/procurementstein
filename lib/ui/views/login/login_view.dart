import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Hello',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('There',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 20.0),
                  buildPasswordTextField(),
                  SizedBox(height: 5.0),
                  buildForgotPassword(),
                  SizedBox(height: 40.0),
                  buildLoginButton(),
                  SizedBox(height: 20.0),
                  _buildLoginWithFacebook(),
                  _buildLoginWithGoogle(),
                ],
              )),
          SizedBox(height: 15.0),
          _buildNeedToSignUpRow(context)
        ],
      ),
    );
  }

  Row _buildNeedToSignUpRow(BuildContext context) {
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
                Navigator.of(context).pushNamed('/signup');
              },
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        );
  }

  Container buildLoginButton() {
    return Container(
      height: 40.0,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.greenAccent,
        color: Colors.green,
        elevation: 7.0,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
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
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  TextField buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
      obscureText: true,
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'EMAIL',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }

  Container _buildLoginWithFacebook() {
    return Container(
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
    );
  }

  Container _buildLoginWithGoogle() {
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
                AssetImage('assets/images/google.jpg'),
                // size:50,
              // fit:
              ),
            ),
            SizedBox(width: 10.0),
            Center(
              child: Text('Log in with Google',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
            ),],
          // ],
        ),
      
    ));
  }
}
