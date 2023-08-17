import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/name_route_string.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  get int => priority = 0;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
   
     if(
        myServices.sharedPreferences.getString("login") == "true") {
         const RouteSettings(name: RouteStringName.home);
    }

    return null;
  }
}
