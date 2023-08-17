import 'package:ecommerce/controller/auth/sing_up_controller.dart';
import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/core/constant/name_route_string.dart';
import 'package:ecommerce/core/model/user_model.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/core/services/shared_save_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/services/fireStore_save_data_user.dart';

abstract class SingInController extends GetxController {
  singInWithGoogle();
  singInWithFacebook();
  singInWithEmailAndPassword();
  showOrHidePassword();
  gotoSingUp();
}

class SingInControllerImp extends SingInController {
  // varibel to auth google
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // varibel firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //varibel facebook
  final _facebookSingIn = FacebookAuth.instance;
  // varibels to data user
  GlobalKey<FormState> key = GlobalKey();
  String? email;
  String? password;
  StatuesRequest? statuesRequest;
  final _user = Rxn<User>();
  String? get user => _user.value?.email;
  MyServices myServices = MyServices();

  bool showPassword = true;
  FireStoreSaveDataUser userSave = FireStoreSaveDataUser();
  SharedSaveUserData sharedSaveUserData = Get.find();
  UserModel userModel=UserModel(email: "", phone: "", image:"", userId: "", name: "");
  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  @override
  singInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await _auth.signInWithCredential(credential).then((user) {
      userSave
          .addToFireStoreUser(user)
          .then((_) => Get.offAllNamed(RouteStringName.home));
    });
  }

  @override
  singInWithFacebook() async {
    final result = await _facebookSingIn.login();
    final userCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    return _auth
        .signInWithCredential(userCredential)
        .then((user) => userSave.addToFireStoreUser(user))
        .then((_) => Get.offAllNamed(RouteStringName.home));
  }

  @override
  void singInWithEmailAndPassword() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        statuesRequest = StatuesRequest.loading;
        update();
        await _auth
            .signInWithEmailAndPassword(email: email!, password: password!)
            .then((user) async {
          await userSave.currentUser(user.user!.uid).then((userData) {
            print(userData.data());
            sharedSaveUserData.setDataUser(
                userModel.fromJson(userData.data() as Map<dynamic, dynamic>));
            print("true");
          });
          Get.offAllNamed(RouteStringName.home);
        });
      } catch (e) {
        print("________________________________");
        print(e.toString());

        Get.snackbar("error", e.toString());
        statuesRequest = StatuesRequest.failure;
      }
    }
  }

  @override
  showOrHidePassword() {
    showPassword = showPassword == false ? true : false;
    update();
  }

  @override
  gotoSingUp() {
    Get.offAllNamed(RouteStringName.singUp);
  }
}
