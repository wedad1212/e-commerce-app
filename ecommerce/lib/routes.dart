import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/middleware/my_middleware_login.dart';
import 'package:ecommerce/core/model/product_model.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/screens/auth/singup_screen.dart';
import 'package:ecommerce/view/screens/home/cart_screen.dart';
import 'package:ecommerce/view/screens/home/home_screen.dart';

import 'package:ecommerce/view/screens/home/profile_screen.dart';
import 'package:ecommerce/view/screens/language_screen.dart';
import 'package:ecommerce/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/name_route_string.dart';
import 'core/middleware/my_middleware.dart';

final controller = Get.find<HomeContrllerImp>();
ProductModel productModel = ProductModel("", "", "", Colors.white, "", "","");
List<GetPage<dynamic>>? getPages = [
//  one page Language
  GetPage(name: '/', page: () => const LanguageScreen(), middlewares: [
    MyMiddleWare(),
  ]),
  // on Boarding Pages
  GetPage(
      name: RouteStringName.onBoarding, page: () => const OnBoardingScreen()),
  // auth login
  GetPage(
      name: RouteStringName.login,
      page: () => const LoginScreen(),
      middlewares: [
        MyMiddleWareLogin(),
      ]),

  // auth singUp
  GetPage(name: RouteStringName.singUp, page: () => const SingUpScreen()),
  // home
  GetPage(
    name: RouteStringName.home,
    page: () => Scaffold(
        body: GetBuilder<HomeContrllerImp>(
      builder: (controller) => controller.currentPage,
    ))),
  GetPage(name: RouteStringName.cart, page: () => CartScreen()),
  GetPage(name: RouteStringName.profile, page: () =>  ProfileScreen()),
];
