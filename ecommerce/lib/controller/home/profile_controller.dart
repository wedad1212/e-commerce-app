import 'package:ecommerce/core/constant/name_route_string.dart';
import 'package:ecommerce/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/services/shared_save_user.dart';

abstract class ProfileController extends GetxController {
  singOut();
}

class ProfileControllerImp extends ProfileController {
  SharedSaveUserData sharedSaveUserData = Get.find();
  @override
  Future<void> singOut() async {
    try {
     FirebaseAuth.instance.signOut();
      print("singout");
     GoogleSignIn().signOut();
    //  await FacebookAuth.instance.logOut();
      sharedSaveUserData.deleteUserData();
        update();
    } catch (e) {
      print(e.toString());
    }
  }
}
