import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/promo_code_tile.dart';
import 'package:onlinebia/apps/view/promo_code/promo_code_page.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';

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
      fillColor: AppColor.FieldColor,
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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.FieldColor),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.FieldColor),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.FieldColor),
        borderRadius: BorderRadius.circular(30),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.FieldColor),
        //.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(30),
      ),

      errorStyle: TextStyle(
        color: Colors.red, // Theme.of(navigatorKey.currentContext).errorColor
      ),
      errorMaxLines: 2,
    );
  }
}