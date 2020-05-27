import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: _buildSpinner(context),
    );
  }

  Widget _buildSpinner(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
          SpinKitPouringHourglass(
            color: Colors.white,
            size: 50,
          ),
          // SizedBox(height:10),
          // Text('Loading'),
        ],
      ),
    );
  }
}
