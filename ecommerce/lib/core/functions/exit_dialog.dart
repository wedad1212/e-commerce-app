import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

Future<bool> exsitDialog() {
  Get.defaultDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(30),
      title: "titleExit".tr,
      middleText: "bodyExit".tr,
      titleStyle: const TextStyle(fontSize: 20),
      middleTextStyle: const TextStyle(
          fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "cancel".tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              exit(0);
            },
            child: Text(
              "confirm".tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ))
      ]);
  return Future.value(true);
}
