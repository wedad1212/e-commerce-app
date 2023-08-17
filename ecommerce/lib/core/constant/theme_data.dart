import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData themeDataArabic = ThemeData(
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
      bodySmall: TextStyle(
        fontSize: 17,
        color: grey,
      )),
  fontFamily: "Cario",
//  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

final ThemeData themeDataEnglish = ThemeData(
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: textColor),
      bodySmall: TextStyle(
        fontSize: 20,
        color: grey,
      )),
  fontFamily: "Playfair Display",
);
