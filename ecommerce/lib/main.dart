import 'package:ecommerce/Binding/my_binding.dart';
import 'package:ecommerce/controller/auth/sing_in_controller.dart';
import 'package:ecommerce/controller/home/cart_controller.dart';
import 'package:ecommerce/core/constant/theme_data.dart';
import 'package:ecommerce/core/services/shared_save_user.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/screens/home_or_singin_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home/product_controller.dart';
import 'core/localization/translation.dart';
import 'core/localization/translation_controller.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices().initialServices();
  await Firebase.initializeApp();
    Get.put(SharedSaveUserData());
  Get.put(CartControllerImp(), permanent: true);
  Get.put(SingInControllerImp());
  Get.put(
    ProductControllerImp(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MyTranslationController controller = Get.put(MyTranslationController());
    return GetMaterialApp(
      initialBinding: MyBinding(),
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: themeDataEnglish,
      home: HomeOrSingIn(),
      getPages: getPages,
    );
  }
}
