import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';

import 'AppColor.dart';
import 'Fonts.dart';

class CustomInputDecoration {


  static InputDecoration getInputDecorationForAuth({String? hintText, String? labelText, String? assetImage}){
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,

      floatingLabelBehavior: FloatingLabelBehavior.always,

      hintText: hintText??"",
      hintStyle: Fonts.fieldHintStyle,

      labelText: labelText??"",
      labelStyle: Fonts.fieldLabelStyle,

      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),


      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appTextBorder, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appTextBorder, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appTextBorder, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appTextBorder.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),

      errorStyle: TextStyle(
        color: Colors.red, // Theme.of(navigatorKey.currentContext).errorColor
      ),
      errorMaxLines: 2,
    );
  }

  static InputDecoration getInputDecoration({String? hintText, String? labelText, String? assetImage, bool obscureText=false, Function? secureClick, bool passwordIcon=false}){
    return InputDecoration(
      fillColor: AppColor.FieldColor,
      filled: true,


      floatingLabelBehavior: FloatingLabelBehavior.always,

      hintText: hintText??"",
      hintStyle: Fonts.fieldHintStyle,



      labelText: labelText??"",
      labelStyle: Fonts.fieldLabelStyle,

        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: assetImage==""||assetImage==null?Container():Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetsHelper.getIcon(assetImage),
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 15,),
              Container(
                width: 1,
                height: 60,
                color: Colors.grey.shade300,
              )
            ],
          ),
        ),

        suffixIcon: passwordIcon?IconButton(
            icon: obscureText?Icon(Icons.visibility_off_outlined, color: Colors.grey,): Icon(Icons.visibility_outlined, color: Colors.grey),
            color: Colors.black,
            onPressed: () => secureClick!(),
        ):null,

      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),


      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appDivider),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
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