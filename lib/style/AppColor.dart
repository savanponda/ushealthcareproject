import 'package:flutter/material.dart';

class AppColor
{

  static Color appColor = Color(0xff9152F1);
  static Color appColorLight = Color(0xff30A0E0);


  static Color appBarText = Color(0xff111111);
  static Color appErrorText = Color(0xffE53935);
  static Color appBtnErrorText = Color(0xffFF2222);


  static Color appTextBorder = Color(0xff67e7d2);

  static Color appSubTitleText = Color(0xff78828A);
  static Color appOrangeLight = Color(0xffFFE3B3);

  static Color appGreen = Color(0xff00C566);
  static Color appGreenLight = Color(0xffD9EF82);

  static Color appDivider = Color(0xffe7e9eb);
  static Color appBgGray = Color(0xffD9D9D9);
  static Color appTitle = Color(0xff050505);
  static Color appWhite = Color(0xffFEFEFE);

  static Color Buttonbgcolor = Color(0xffFFF2ED);
  static Color ButtonDeSelectbgcolor = Color(0xffECF1F6);
  static Color Buttontextcolor = Color(0xffFF784B);
  static Color Buttontext = Color(0xffFEFEFE);
  static Color notificationBG = Color(0xffe3e7ec);

  static Color FieldColor = Color(0xffF6F8FE);
  static Color FieldTextColor = Color(0xff9CA4AB);
  static Color FieldBorderColor = Color(0xffF6F6F6);
  static Color appLightBlack = Color(0xff808d9e);
  static Color editTextColor = Color(0xff7e8ca0);

  static Color strikedText = Color(0xffA6AEBE);



  static Color fromHex(String? hexString) {

    if(hexString==null)
      return Colors.black;

    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}