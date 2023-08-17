// ignore_for_file: must_be_immutable

import 'package:ecommerce/core/constant/name_route_string.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/auth/sing_in_controller.dart';
import '../../controller/home/home_controller.dart';

class HomeOrSingIn extends StatelessWidget {
  SingInControllerImp singInControllerImp = Get.find();

  HomeOrSingIn({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        body: singInControllerImp.user != null
            ? GetBuilder<HomeContrllerImp>(
                builder: (controller) => controller.currentPage)
            :const LoginScreen());
  }
}
