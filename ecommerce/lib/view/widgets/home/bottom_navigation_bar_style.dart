// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constant/colors.dart';
import 'package:ecommerce/core/constant/const_image_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarStyle extends StatelessWidget {
  BottomNavigationBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContrllerImp>(
      builder: (controller) => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.toChangeIndexBottonNavigation(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      ConstImage.explorer,
                      width: 40,
                      height: 40,
                    )),
                activeIcon: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "explorer",
                      style: TextStyle(color: textColor),
                    )),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      ConstImage.cart,
                      width: 35,
                      height: 35,
                    )),
                activeIcon: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "cart",
                      style: TextStyle(color: textColor),
                    )),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      ConstImage.profile,
                      width: 35,
                      height: 35,
                    )),
                activeIcon: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "profile",
                      style: TextStyle(color: textColor),
                    )),
                label: ""),
          ]),
    );
  }
}
