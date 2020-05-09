// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:health_financer/packageLib.dart';
// import 'package:health_financer/ui/apphomePage.dart';

// class UserManagement {
//   createNewUser(AuthResult authResult, context) {
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
//             return AppHomePage();
//           } else {
//             return LoginPage();
//           }
//         });
//   }

//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }