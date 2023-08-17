import 'package:ecommerce/core/constant/name_route_string.dart';

import 'package:ecommerce/core/services/fireStore_save_data_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statues_request.dart';
import '../../core/model/user_model.dart';
import '../../core/services/shared_save_user.dart';

abstract class SingUpController extends GetxController {
  createUser();
  goToSingIn();
  saveUserDataToProfile(UserCredential user);
}

class SingUpControllerImp extends SingUpController {
  GlobalKey<FormState> key = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, phone, image, name;
  StatuesRequest? statuesRequest;
  FireStoreSaveDataUser userSave = FireStoreSaveDataUser();
  SharedSaveUserData sharedSaveUserData = Get.find();
  @override
  createUser() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        statuesRequest = StatuesRequest.loading;
        update();
        await _auth
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((user) async {
          saveUserDataToProfile(user);
          Get.toNamed(RouteStringName.home);
        });
     
      } catch (e) {
        Get.snackbar("error", "$e.message");
      }
    }
  }

  @override
  goToSingIn() {
    Get.offAllNamed(RouteStringName.login);
  }

  @override
  saveUserDataToProfile(UserCredential user) async {
    final userModel = UserModel(
      name: name!,
      // name: name==null?user.user.displayName:name!,
      email: user.user!.email!,
      phone: phone!,
      image: '',
      userId: user.user!.uid,
    );
    await userSave.addToFireStoreUser(userModel);
   await sharedSaveUserData.setDataUser(userModel);
  }
}
