

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/name_route_string.dart';
import '../../core/services/services.dart';
import '../../data/model/on_bording_list_static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onChangePage(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  PageController pageController = PageController();
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > listOnBoarding.length - 1) {
      myServices.sharedPreferences.setString('onBoarding', "true");
      Get.offAllNamed(RouteStringName.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeIn);
    }
  }

  @override
  onChangePage(int index) {
    currentPage = index;
    update();
  }
}
