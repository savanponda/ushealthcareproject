import 'package:flutter/material.dart';

class AppColor
{

  static Color appButton = Color(0xff9152F1);
  static Color FieldColor = Color(0xffF6F8FE);
  static Color FieldTextColor = Color(0xff9CA4AB);
  static Color appBar = Color(0xff111111);
  static Color Buttonbgcolor = Color(0xffFFF2ED);
  static Color Buttontextcolor = Color(0xffFF784B);




  static Color appColor = Color(0xff0062ff);
  static Color appColorLight = Color(0xff30A0E0);

  static Color appBarText = Color(0xff242b42);


  static Color appTextBorder = Color(0xff67e7d2);

  static Color appOrange = Color(0xffFFC973);
  static Color appOrangeLight = Color(0xffFFE3B3);

  static Color appGreen = Color(0xffB5D43B);
  static Color appGreenLight = Color(0xffD9EF82);

  static Color appDivider = Color(0xffe6e9ed);
  static Color appBgGray = Color(0xfff8f8fb);
  static Color appTitle = Color(0xff050505);

  static Color FieldBorderColor = Color(0xffE4E4E4);
  static Color appLightBlack = Color(0xff808d9e);
  static Color editTextColor = Color(0xff7e8ca0);




  static Color fromHex(String? hexString) {

    if(hexString==null)
      return Colors.black;

    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}