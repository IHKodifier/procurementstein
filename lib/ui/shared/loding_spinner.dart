import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.white,
      child: _buildSpinner(context),
    );
  }

  SizedBox _buildSpinner(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[ 
            SpinKitHourGlass(
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
            SizedBox(height:10),
            Text('Loading'),
          ],
        ),
      ),
    );
  }
}
