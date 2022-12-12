import 'package:flutter/material.dart';

import 'myColor.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.primaryLightColor,
      elevation: 0,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: MyColor.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: MyColor.greenColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: MyColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: MyColor.primaryLightColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: MyColor.greenColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: MyColor.backgroundLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColor.primaryLightColor,
      unselectedItemColor: MyColor.greyColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.primaryLightColor,
      elevation: 0,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: MyColor.greenColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: MyColor.primaryLightColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: MyColor.greenColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: MyColor.backgroundDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColor.primaryLightColor,
      unselectedItemColor: MyColor.whiteColor,
    ),
  );
}
