// ignore_for_file: unused_field

import 'package:ecommerce/view/screens/home/cart_screen.dart';
import 'package:ecommerce/view/screens/home/home_screen.dart';
import 'package:ecommerce/view/screens/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  toChangeIndexBottonNavigation(int index);
}

class HomeContrllerImp extends HomeController {
  int _currentIndex = 0;
  Widget _currentPage = HomeScreen();
  get currentPage => _currentPage;
  get currentIndex => _currentIndex;
  @override
  toChangeIndexBottonNavigation(index) {
    _currentIndex = index;
      update();
    switch (_currentIndex) {
      case 0:
        {
          _currentPage = HomeScreen();
          break;
        }
      case 1:
        {
          _currentPage = CartScreen();
          break;
        }
      case 2:
        {
          _currentPage = ProfileScreen();
          break;
        }
      
    }
      update();
  
  }
}
