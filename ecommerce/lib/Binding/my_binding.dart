import 'package:ecommerce/controller/auth/sing_in_controller.dart';
import 'package:ecommerce/controller/home/category_controller.dart';
import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/controller/home/product_controller.dart';
import 'package:get/get.dart';

import '../controller/home/cart_controller.dart';
import '../controller/home/profile_controller.dart';
import '../core/services/shared_save_user.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
   // Get.lazyPut(() => SingInControllerImp());
    Get.lazyPut(() => HomeContrllerImp());
    Get.lazyPut(() => CategoryControllerImp(), fenix: true);
    // Get.lazyPut(() => SharedSaveUserData());
   
    Get.lazyPut(() => ProfileControllerImp());
    Get.lazyPut(() => SingInControllerImp());
  }
}
