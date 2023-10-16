import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/promo_code_tile.dart';
import 'package:UShealthcare/apps/view/promo_code/promo_code_page.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';

import 'AppColor.dart';
import 'Fonts.dart';

class CustomInputDecoration {

  static InputDecoration getInputDecoration(
      {
        String? hintText,
        String? labelText,
        bool applyIcon = false,
        String? assetImage,
        bool obscureText = false,
        Function? secureClick,
        Function? applyButtonClick,
        bool passwordIcon = false
      }) {
    return InputDecoration(
      fillColor: AppColor.appColorWhite,
      filled: true,


      floatingLabelBehavior: FloatingLabelBehavior.always,

      hintText: hintText ?? "",
      hintStyle: Fonts.fieldHintStyle,

      labelText: labelText ?? "",
      labelStyle: Fonts.fieldLabelStyle,
      suffixIcon: passwordIcon ? IconButton(
        icon: obscureText ? Icon(
          Icons.visibility_off_outlined, color: Colors.grey,) : Icon(
            Icons.visibility_outlined, color: Colors.grey),
        color: Colors.black,
        onPressed: () => secureClick!(),
      ) : applyIcon ? InkWell(
        onTap: () => applyButtonClick!() ,
        child: Container(
          width: 100,
          child: Center(child: Text("Apply")),
        ),
      ) : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider),
        borderRadius: BorderRadius.circular(10),

      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),

      errorStyle: TextStyle(
        color: Colors.red, // Theme.of(navigatorKey.currentContext).errorColor
      ),
      errorMaxLines: 2,
    );
  }
}