// import 'dart:math';

// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:procuremenstein/bloc/app_user.dart';
// // import 'package:procuremenstein/bloc/user_management.dart';
// // import 'package:procuremenstein/screens/app_drawer.dart';
// // import 'package:procuremenstein/widget/inner.dart';
// import 'package:procuremenstein/services/authentication_service.dart';
// // import 'package:procuremenstein/screens/login_page.dart';
// // // import 'package:procuremenstein/services/authentication_service.dart';
// // import 'package:procuremenstein/shared/loding_spinner.dart';
// // import 'package:provider/provider.dart';

// class AppHome extends StatefulWidget {
//   // MyHomePage()

//   @override
//   _AppHomeState createState() => _AppHomeState();
// }

// class _AppHomeState extends State<AppHome> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // AuthenticationBloc authBloc = Provider.of<AuthenticationBloc>(context);
//     // if (authBloc.authenticatedUser == null)
//       return LoginPage(); 
//       // else 
//     return Scaffold(
//       drawer: AppDrawer(),
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // InnerText(),
//             SizedBox(
//               height: 50,
//             ),
          
//             Text('You have logged in successfully'),
//             SizedBox(height: 50),
//             RaisedButton(
//                 child: Text('Log out'),
//                 onPressed: () {
//                   // AuthenticationBloc().handleSignOut();
//                   // initialData: ,
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
