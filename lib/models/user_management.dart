// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:procuremenstein/screens/app_home.dart';
// import 'package:procuremenstein/screens/login_page.dart';
// import 'package:procuremenstein/shared/loding_spinner.dart';
// import '';

// class UserManagement {
//   createNewUser(AuthResult authResult, context) {

//     // BuildContext _context
//     Firestore.instance.collection('/users').add({
//       'email': authResult.user.email,
//       'uid': authResult.user.uid,
//       'roles': 'kiosk,doctor',
//       'createdBy': 'debugAdmin',
//     }).then((value) {
//       Navigator.of(context).pop();
//       Navigator.pushReplacementNamed(context, '/newAccountSuccess');
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   Widget handleAuth() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.onAuthStateChanged,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             // AuthenticationBloc.
//             return AppHome();
//           } else {
//             return LoginPage();
//           }
//         });
//   }

//   Widget handleSignOut(BuildContext context) {
//     return FutureBuilder(
//       future: FirebaseAuth.instance.signOut(),
//       // initialData: InitialData,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData)
//           return LoadingSpinner();
//         else
//           Navigator.of(context).popAndPushNamed('/login');
//       },
//     );

//     FirebaseAuth.instance.signOut();
//   }
// }
