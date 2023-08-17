
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController/boarding_controller.dart';
import '../../../core/constant/colors.dart';

class ButtomOnBoarding extends GetView<OnBoardingControllerImp> {
  const ButtomOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.next();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [textColor, primaryColor])),
        child: Text(
          textAlign: TextAlign.center,
          "botton".tr,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
