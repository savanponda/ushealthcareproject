import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/ValidationHelper.dart';
import '../style/AppColor.dart';
import '../style/Fonts.dart';
import '../style/InputDecoration.dart';


class TextView extends StatelessWidget {

  TextView({
    Key? key,
    this.label,
    this.phoneIcon = false,
    this.passwordIcon = false,
    this.emailIcon = false,
    this.userIcon = false,
    this.controller,
    this.focusNode,
    this.isValid,
    this.invalidMsg,
    this.assetIcon,
    this.obscureText = false,
    this.textInputAction = false,
    this.keyboardTypetext = false,
    this.keyboardTypeEmail = false,
    this.keyboardTypeNumber = false,
    this.textCapitalization = false,
    this.obscuringCharacter = false,
    this.inputFormatters = false,
    this.emailValidator = false,
    this.mobileValidator = false,
    this.passwordValidator = false,
    this.btnClick,
  }) : super(key: key);

  final String? label;
  final bool phoneIcon;
  final bool emailValidator;
  final bool mobileValidator;
  final bool passwordValidator;
  final bool passwordIcon;
  final bool emailIcon;
  final bool userIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isValid;
  final String? invalidMsg;
  final String? assetIcon;
  late bool obscureText;
  final bool textInputAction;
  final bool keyboardTypetext;
  final bool keyboardTypeEmail;
  final bool keyboardTypeNumber;
  final bool textCapitalization;
  final bool obscuringCharacter;
  final bool inputFormatters;
  final Function? btnClick;

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      focusNode:focusNode,
      obscureText: obscureText,
      style: Fonts.fieldStyle,

      decoration: CustomInputDecoration.getInputDecoration(
        assetImage: assetIcon,
        obscureText: obscureText,
        hintText: label,
        passwordIcon:passwordIcon,
        secureClick: () => btnClick!(),
        // errorText: isValid ? null : invalidMsg,
        // errorStyle: TextStyle(color: AppColor.appColor),
        // labelStyle: TextStyle(color: AppColor.appColor),
        // errorBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColor.appColor),
        // ),
        // focusedErrorBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColor.appColor),
        // ),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColor.appColor),
        // ),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColor.appColor),
        // )
      ),

      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardTypeEmail?TextInputType.emailAddress
          :keyboardTypeNumber?TextInputType.number
          :keyboardTypetext?TextInputType.text:null,
      textCapitalization: TextCapitalization.words,
      obscuringCharacter: "*",
      inputFormatters: [LengthLimitingTextInputFormatter(100)],
      validator: (value) => mobileValidator?
      ValidationHelper.checkMobileNoValidation(context, value!)
          :emailValidator?ValidationHelper.checkEmailValidation(context, value)
          :passwordValidator?ValidationHelper.checkPasswordValidation(context, value!, "Error"):null,

    );
  }
}