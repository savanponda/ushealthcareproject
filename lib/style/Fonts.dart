import 'package:flutter/material.dart';

import 'AppColor.dart';

class Fonts {

  static TextStyle titleStyle = new TextStyle(
    fontSize: 28,
    fontStyle: FontStyle.normal,
    color: AppColor.appBarText,
    fontWeight: FontWeight.w500,
    fontFamily: "AppBold",
  );


  static TextStyle appBottomTitle = new TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColor.appColor,
    fontWeight: FontWeight.w500,
    fontFamily: "AppSemiBold",
  );


  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    color: AppColor.appBarText,
    fontWeight: FontWeight.w500,
    fontFamily: "AppSemiBold",
  );

  static TextStyle appPopUpTextStyle = TextStyle(
    fontSize: 24,
    color: AppColor.appColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFamily: "AppRegular",
  );

  static TextStyle headerStyle = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: "AppRegular",
  );

  static TextStyle viewAllStyle = new TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColor.appColor,
    fontWeight: FontWeight.w600,
    fontFamily: "AppSemiBold",
  );
  static TextStyle profileMenuStyle = new TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColor.appTitle,
    fontWeight: FontWeight.w500 ,
    fontFamily: "AppBold",
  );


  static TextStyle productDetailtStyle = new TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: "AppSemiBold",
  );

  static TextStyle buttonStyle = new TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: "AppBold",
  );

  static TextStyle socialButtonStyle = new TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: "AppSemiBold",
  );



  static TextStyle fieldStyle = TextStyle(
    fontSize: 15,
    color: AppColor.editTextColor,
    fontFamily: "AppRegular",
  );
  static TextStyle fieldHintStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
    fontFamily: "AppRegular",
  );
  static TextStyle fieldLabelStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
    fontFamily: "AppRegular",
  );
}