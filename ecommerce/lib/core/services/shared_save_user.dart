// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/core/model/cart_model.dart';
import 'package:ecommerce/core/model/user_model.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

import '../constant/const_name_data.dart';

class SharedSaveUserData extends GetxController {
  final MyServices myService = MyServices();
  CartModel? cartModel;
  Future<CartModel?>? get getUserData async {
    final getDataUser = await _getUserData(cartModel!);
    try {
      if (getDataUser == null) {
        return null;
      } else {
        return getDataUser;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CartModel> _getUserData(CartModel cartModel) async {
    final valueDataUser = myService.sharedPreferences.getString(sharedUserData);
    return cartModel.formJson(json.decode(valueDataUser!));
  }

  setDataUser(UserModel userModel) async {
    await myService.sharedPreferences
        .setString(sharedUserData, json.encode(userModel.toJson()));
  }

  deleteUserData() async {
    await myService.sharedPreferences.clear();
  }
}
