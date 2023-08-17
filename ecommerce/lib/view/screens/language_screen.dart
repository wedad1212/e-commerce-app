import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/const_image_route.dart';
import '../../core/constant/name_route_string.dart';
import '../../core/localization/translation_controller.dart';
import '../widgets/auth/botton_style.dart';

class LanguageScreen extends GetView<MyTranslationController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(children: [
        Expanded(
          child: Image.asset(
            ConstImage.imageAuth,
            width: 200,
            height: 200,
          ),
        ),
        Expanded(
          child: Text(
            "1".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BottonStyleAuth(
          width: double.infinity,
          onPressed: () {
            controller.changeLanguage('ar');
            Get.toNamed(RouteStringName.onBoarding);
          },
          textbotton: "arabic".tr,
        ),
        BottonStyleAuth(
          width: double.infinity,
          onPressed: () {
            controller.changeLanguage('en');
            Get.toNamed(RouteStringName.onBoarding);
          },
          textbotton: "english".tr,
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
