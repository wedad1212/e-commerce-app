
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoardingController/boarding_controller.dart';
import '../widgets/onBoardingWidgets/buttom_on_boarding.dart';
import '../widgets/onBoardingWidgets/dots_on_boarding.dart';
import '../widgets/onBoardingWidgets/slider_on_boarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(children: [
            Expanded(flex: 3, child: SliderOnBoarding()),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DotsOnBoarding(),
                    Spacer(
                      flex: 1,
                    ),
                    ButtomOnBoarding()
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
