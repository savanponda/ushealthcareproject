

import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppTheme {
  static Color lightBG = Color(0xffffffff);

  static Map<int, Color> myColor = {
    50: Color.fromRGBO(6,62,96, .1),
    100: Color.fromRGBO(6,62,96, .2),
    200: Color.fromRGBO(6,62,96, .3),
    300: Color.fromRGBO(6,62,96, .4),
    400: Color.fromRGBO(6,62,96, .5),
    500: Color.fromRGBO(6,62,96, .6),
    600: Color.fromRGBO(6,62,96, .7),
    700: Color.fromRGBO(6,62,96, .8),
    800: Color.fromRGBO(6,62,96, .9),
    900: Color.fromRGBO(6,62,96, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFF063e60, myColor);

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColor.appColor.withOpacity(.5),
      cursorColor: AppColor.appColor.withOpacity(.6),
      selectionHandleColor: AppColor.appColor.withOpacity(1),
    ),
    fontFamily: "AppRegular",
    backgroundColor: AppColor.appBgGray,
    primaryColor: colorCustom,
    primarySwatch: colorCustom,
    hintColor: colorCustom,
    focusColor: colorCustom,
    scaffoldBackgroundColor: lightBG,
    //brightness: Brightness.light,
    // textTheme: TextTheme(
    //   subtitle1: TextStyle(color: Colors.black),
    // ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    appBarTheme: AppBarTheme(
      elevation: 0, toolbarTextStyle: TextTheme(
        subtitle1: TextStyle(
          fontFamily: "AppRegular",
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ).bodyText2, titleTextStyle: TextTheme(
        subtitle1: TextStyle(
          fontFamily: "AppRegular",
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ).headline6,
      //brightness: Brightness.dark
    ),
  );
}