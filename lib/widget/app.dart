import 'package:flutter/material.dart';
import 'package:procuremenstein/screens/app_home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'procuremenStein-Stein',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        // brightness: Brightness.dark
      ),
      home: MyHomePage(),
    );
  }
}
