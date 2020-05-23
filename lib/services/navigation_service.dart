import 'package:flutter/material.dart';

class NavigationService {
 final  GlobalKey<NavigatorState> _navigatiorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigatiorKey;

  bool goBack() {
    return _navigatiorKey.currentState.pop() as bool;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigatiorKey.currentState
        .pushNamed(routeName);
  }
}
