import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController/boarding_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/model/on_bording_list_static.dart';

class DotsOnBoarding extends StatelessWidget {
  const DotsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  listOnBoarding.length,
                  (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 900),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: textColor,
                        ),
                        width: controller.currentPage == index ? 20 : 7,
                        height: 7,
                      )),
            ));
  }
}
