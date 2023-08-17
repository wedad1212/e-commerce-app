import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/sing_in_controller.dart';

import '../constant/name_route_string.dart';
import '../services/services.dart';

class MyMiddleWareLogin extends GetMiddleware {
  get int => priority = 0;
  MyServices myServices = Get.find();
  final controller = Get.put(SingInControllerImp());
  @override
  RouteSettings? redirect(String? route) {
    if (controller.user != null) {
      return const RouteSettings(name: RouteStringName.home);
    }
    return null;
  }
}
