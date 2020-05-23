import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';
// import 'package:procuremenstein/screens/app_home.dart';
// import 'package:procuremenstein/screens/login_page.dart';
// import 'package:procuremenstein/shared/loding_spinner.dart';
import 'package:provider/provider.dart';

class AuthHandler extends StatefulWidget {
  @override
  _AuthHandlerState createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  Future<FirebaseUser> authFuture; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authFuture= FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
 

    return FutureBuilder(
      future: authFuture,
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // if (!snapshot.hasData) return LoadingSpinner();
        // else  if (snapshot.data==null) return LoginPage();
        // else return AppHome();
      },    );
  }
}
