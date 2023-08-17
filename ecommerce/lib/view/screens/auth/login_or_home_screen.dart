
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrHome extends StatelessWidget {
  const LoginOrHome({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = MyServices();
    return Obx(() {
      return (myServices.sharedPreferences.getString("loading") == "true")
          ? HomeScreen()
          :const LoginScreen();
    });
  }
}
