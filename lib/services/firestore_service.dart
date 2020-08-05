import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procuremenstein/app/service_locator.dart';
import 'package:procuremenstein/models/app_user.dart';
import 'package:procuremenstein/services/console_utility.dart';
import 'package:procuremenstein/services/dialog_service.dart';

class FirestoreService {
  final DialogService dialogService = serviceLocator<DialogService>();

  final CollectionReference _usercollectionReference =
      Firestore.instance.collection('userProfiles');

  Future<bool> createUserProfile(
    // AuthResult authResult,
    // var userProfileData,
    UserProfile userProfile,
  ) async {
    try {
      await _usercollectionReference
          .document(userProfile.id)
          .setData(userProfile.toJson());
    } catch (e) {
      ConsoleUtility.printToConsole(
          'Firestore service\n createUserProfile\nerror encountered: \n${e.toString()}');
      dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    }
  }
}
