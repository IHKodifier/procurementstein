import 'package:flutter/material.dart';
import 'package:procuremenstein/app.dart';
import 'package:procuremenstein/locator.dart';

void main() {
    // Register all the models and services before the app starts
  setupLocator();


  runApp(App());
}
