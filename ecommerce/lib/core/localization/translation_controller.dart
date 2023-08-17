
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/theme_data.dart';
import '../services/services.dart';

class MyTranslationController extends GetxController {
  Locale? language;
  ThemeData themeData = themeDataEnglish;
  MyServices myServices = Get.find();
  changeLanguage(String codeLan) {
    Locale locale = Locale(codeLan);
    myServices.sharedPreferences.setString('lang', codeLan);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedString = myServices.sharedPreferences.getString('lang');
    if (sharedString == 'ar') {
      language = const Locale('ar');
      themeData = themeDataArabic;
    } else if (sharedString == 'en') {
      language = const Locale('en');
      themeData = themeDataEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      themeData = themeDataEnglish;
    }
    super.onInit();
  }
}
