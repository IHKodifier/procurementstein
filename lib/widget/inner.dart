import 'package:flutter/material.dart';
import 'package:procuremenstein/bloc/authentication_bloc.dart';
// import 'package:procuremenstein/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';

class InnerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc =
        Provider.of<AuthenticationBloc>(context);

    return Center(
      child: Container(
        child: Text(
            authenticationBloc.authenticatedUser.displayName,style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}
