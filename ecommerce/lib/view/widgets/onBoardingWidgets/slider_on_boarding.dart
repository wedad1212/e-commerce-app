import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController/boarding_controller.dart';
import '../../../data/model/on_bording_list_static.dart';

class SliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onChangePage(value);
        },
        itemCount: listOnBoarding.length,
        itemBuilder: (context, page) => Column(
              children: [
                Image.asset(
                  listOnBoarding[page].imageUrl,
                  width: 200,
                  height: 200,
                  scale: 1.0,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  textAlign:TextAlign.center,
                  listOnBoarding[page].title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30)),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  listOnBoarding[page].body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                )
              ],
            ));
  }
}
