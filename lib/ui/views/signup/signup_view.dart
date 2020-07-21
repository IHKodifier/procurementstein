import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:procuremenstein/app/rounded_button.dart';
import 'package:procuremenstein/ui/shared/busy_overlay.dart';
import 'package:procuremenstein/ui/shared/loding_spinner.dart';
import 'package:procuremenstein/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _profileTitleController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  Map<String, dynamic> userData = Map<String, dynamic>();

//handles the user related additional data

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, child) =>
            _buildSingleChildScrollView(context, model),
        viewModelBuilder: () => SignupViewModel());
  }

  Widget _buildSingleChildScrollView(
      BuildContext context, SignupViewModel model) {
    Size size = MediaQuery.of(context).size;
    return BusyOverlay(
      show: model.isBusy,
      child: new Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 100,
                child: _buildStack(),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/signup.svg',
                        height: size.height * 0.25,
                      ),
                      _buildFullNameTextField(context),
                      SizedBox(height: 10.0),
                      _buildEmailTextField(context),
                      SizedBox(height: 10.0),
                      _buildPasswordTextField(context),
                      SizedBox(height: 10.0),
                      _buildToggleButtonsContainer(context, model),
                      SizedBox(height: 10.0),
                      _buildProfileTitleTextField(context),
                      SizedBox(height: 50.0),
                      _buildSignUpButton(context, model),
                      SizedBox(height: 20.0),
                      _buildGoBackButton(context),
                      SizedBox(height: 20.0),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildGoBackButton(BuildContext context) {
    return Container(
        height: 80.0,
        // color: Theme.of(context).primaryColorLight,
        child: Container(
          // decoration: BoxDecoration(
          //     border: Border.all(
          //         color: Colors.black, style: BorderStyle.solid, width: 1.0),
          // borderRadius: BorderRadius.circular(20.0)),
          child: RoundedButton(
            color: Theme.of(context).primaryColorLight,
            press: () {
              //todo service based navigation
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            text: 'Go Back',
          ),
        ));
  }

  Container _buildSignUpButton(BuildContext context, SignupViewModel model) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
      height: 80.0,
      child: RoundedButton(
        // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Theme.of(context).primaryColor,
        press: () {
          //todo implement service based navigation
          model.setBusy(true);
          userData['profileTitle'] = _profileTitleController.text;
          userData['fullName'] = _fullNameController.text;
           userData['email'] = _emailController.text;
                    
          model.signupWithEmil(
            _emailController.text,
            _passwordController.text,
            userData,
          );
        },
        // elevation: 7.0,
        text: 'SIGNUP',
      ),
    );
  }

  TextField _buildProfileTitleTextField(BuildContext context) {
    return TextField(
      controller: _profileTitleController,
      decoration: InputDecoration(
          labelText: 'BUSINESS TITLE ',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }

  TextField _buildPasswordTextField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'PASSWORD ',
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
          // hintText: 'EMAIL',
          // hintStyle: ,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }

  TextField _buildFullNameTextField(BuildContext context) {
    return TextField(
      controller: _fullNameController,
      decoration: InputDecoration(
          labelText: 'FULL NAME',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          // hintText: 'EMAIL',
          // hintStyle: ,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }

  Widget _buildToggleButtonsContainer(
      BuildContext context, SignupViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I am a  potential ',
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildToggleButtons(context, model),
            ],
          ),
        ],
      ),
    );
  }

  ToggleButtons _buildToggleButtons(
      BuildContext context, SignupViewModel model) {
    return ToggleButtons(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                'Buyer',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              FaIcon(
                FontAwesomeIcons.cartArrowDown,
                size: 50,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                'Seller',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              FaIcon(FontAwesomeIcons.truck, size: 45),
            ],
          ),
        ),
      ],
      isSelected: model.roleSelectionValues,
      onPressed: (index) {
        bool value = model.roleSelectionValues[index];
        model.setToggleButtonSelectionValueAt(!value, index);
        // model.selectedRole = model.roles[index];
      },
      selectedColor: Theme.of(context).primaryColor,
      color: Colors.black,
      renderBorder: false,
      // fillColor: Colors.deepPurple,
      splashColor: Theme.of(context).primaryColorLight,
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
