import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/shared/loding_spinner.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
/// 
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class BusyOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;

  const BusyOverlay({this.child,
      this.title = 'Please wait...',
      this.show = false});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
        child: Stack(children: <Widget>[
      child,
      IgnorePointer(
        child: Opacity(
            opacity: show ? 1 : 0.0,
            child: Container(
              color: Colors.transparent.withOpacity(.40),
              width: screenSize.width,
              height: screenSize.height,
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              
              // color: Color.fromARGB(100, 0, 0, 0),
              child: ClipRRect(
                             borderRadius: BorderRadius.circular(20),
                              child: Container(
                 color: Colors.black.withOpacity(0.5),
                  height: screenSize.height*.2 ,
                  width: screenSize.width*.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoadingSpinner(),
                      Text(title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            )),
      ),
    ]));
  }
}
