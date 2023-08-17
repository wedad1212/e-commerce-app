import 'package:ecommerce/controller/home/profile_controller.dart';
import 'package:ecommerce/core/model/user_model.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/name_route_string.dart';
import '../../widgets/home/bottom_navigation_bar_style.dart';

class ProfileScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(builder: (controller)=>
     Scaffold(
          bottomNavigationBar: BottomNavigationBarStyle(),
          body: Center(
              child :GestureDetector(
                      onTap: () {
                        controller.singOut();
                              Get.offAllNamed(RouteStringName.login);
                      },
                      child: const Text("SingOut")))),
    );
  }
}
