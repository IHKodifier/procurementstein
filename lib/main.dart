import 'package:flutter/material.dart';
import 'package:procuremenstein/app/app.dart';
import 'package:procuremenstein/app/service_locator.dart';

void main() {
  // TODO: refactor comments
  // Register all the models and services before the app starts
  registerAllServicesWithLocator();

  runApp(App());
}
