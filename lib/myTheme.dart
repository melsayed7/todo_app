import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff5D9CEC);

  static Color whiteColor = Colors.white;

  static Color greenColor = Color(0xff61E757);

  static Color backgroundLightColor = Color(0xffDFECDB);

  static Color greyColor = Color(0xffC8C9CB);

  static Color blackColor = Color(0xff200E32);

  static Color redColor = Color(0xffEC4B4B);

  static Color backgroundDarkColor = Color(0xff060E1E);

  static Color bottomNavBarColor = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      elevation: 0,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          color: blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
          color: primaryLightColor,
        fontSize: 18,
        //fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: backgroundLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryLightColor,
      unselectedItemColor: greyColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      elevation: 0,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: primaryLightColor,
        fontSize: 18,
        //fontWeight: FontWeight.w200,
      ),
    ),
    scaffoldBackgroundColor: backgroundDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryLightColor,
      unselectedItemColor: whiteColor,
    ),
  );
}
