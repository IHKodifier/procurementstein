import 'package:flutter/material.dart';
import 'package:procuremenstein/bloc/user.dart';

class AuthenticationBloc extends ChangeNotifier {
  User _user = User('Ihtiram@Heartfile.org', 'Ihtiram', 'Khattak');

  User get authenticatedUser => _user;

 
  setAuthenticatedUser(User user){
    this._user = user;
    notifyListeners();
  }
}
