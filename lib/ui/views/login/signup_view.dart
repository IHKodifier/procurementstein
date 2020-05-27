import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/shared/loding_spinner.dart';
import 'package:procuremenstein/ui/views/login/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, child) =>
            _buildSingleChildScrollView(context, model),
        viewModelBuilder: () => SignupViewModel());
  }

  Widget _buildSingleChildScrollView(
      BuildContext context, SignupViewModel model) {
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            child: _buildStack(),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 10.0),
                  _buildPasswordTextField(),
                  SizedBox(height: 10.0),
                  _buildNickNameTextField(),
                  SizedBox(height: 50.0),
                  _buildSignUpButton(context, model),
                  SizedBox(height: 20.0),
                  _buildGoBackButton(context),
                ],
              )),
        ],
      ),
    );
  }

  Container _buildGoBackButton(BuildContext context) {
    return Container(
      height: 40.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Text('Go Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
          ),
        ),
      ),
    );
  }

  Container _buildSignUpButton(BuildContext context,SignupViewModel model) {
    return Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        height: 40.0,
        child: RaisedButton(
          // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Theme.of(context).primaryColor,
          onPressed:() {
              // setbu
              model.setBusy(true);
              model.signupWithEmil(_emailController.text,
                  _passwordController.text, _nickNameController.text);
            }, 
          elevation: 7.0,
          child:  Center(
              child: model.busy
                  ? LoadingSpinner()
                  : Text(
                      'SIGNUP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
            ),
          ),
        );
  }

  TextField _buildNickNameTextField() {
    return TextField(
      controller: _nickNameController,
      decoration: InputDecoration(
          labelText: 'NICK NAME ',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'PASSWORD ',
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
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'EMAIL',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          // hintText: 'EMAIL',
          // hintStyle: ,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }

  Stack _buildStack() {
    return Stack(
      children: <Widget>[
        Container(
          height: 250,
          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
          child: Text(
            'Signup',
            style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
          child: Text(
            '.',
            style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
        )
      ],
    );
  }
}
