import 'package:flutter/material.dart';

import './colors.dart';

ThemeData themeData() {
  return ThemeData(
      fontFamily: 'Montserrat',
      primarySwatch: myColor,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.darkBlue,
      textTheme: const TextTheme(
          displaySmall: TextStyle(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w700,
              fontSize: 35),
          bodyMedium: TextStyle(color: AppColors.textLigthGrey),
          headlineSmall: TextStyle(color: Colors.white)));
}

class AppConstants {
  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 7);
}

// ignore: prefer_const_constructors
MaterialColor myColor = MaterialColor(0xff266b94, <int, Color>{
  50: Color(0xffe6f1f7),
  100: Color(0xffbfd8e6),
  200: Color(0xff93bfcf),
  300: Color(0xff6596b8),
  400: Color(0xff3e7fa8),
  500: Color(0xff266b94),
  600: Color(0xff205d87),
  700: Color(0xff1a4f7b),
  800: Color(0xff14426f),
  900: Color(0xff0d2d59)
});
