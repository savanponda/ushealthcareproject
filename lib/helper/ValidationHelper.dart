import 'package:flutter/cupertino.dart';

import '../localization/AppLocalizations.dart';
import 'Regex.dart';

class ValidationHelper {
  static checkEmailValidation(BuildContext context, String? value) {
    if (value==null) {
      return buildTranslate(context, "emailValidation");
    }
    else if (value.isEmpty) {
      return buildTranslate(context, "emailValidation");
    }
    else if (value.isNotEmpty && !Regex.email.hasMatch(value)) {
      return buildTranslate(context, "emailValidValidation");
    }
    else {
      return null;
    }
  }

  static checkMobileNoValidation(BuildContext context, String value) {

    print("VALUE: "+value);

    if (value.isEmpty) {
      return buildTranslate(context, "mobNoValidation");
    }
    else if (value==null) {
      return buildTranslate(context, "mobNoValidation");
    }
    else if (value.length<7 || value.length>15) {
      return buildTranslate(context, "mobNoValidValidation");
    }
    else {
      return null;
    }
  }
  static checkOtpValidation(BuildContext context, String value) {
    if (value.isEmpty) {
      return buildTranslate(context, "otpValidation");
    }
    else if (value==null) {
      return buildTranslate(context, "otpValidation");
    }
    else if (value.length<5) {
      return buildTranslate(context, "otpValidValidation");
    }
    else {
      return null;
    }
  }

  static checkBoolValidation(BuildContext context, bool value, String errorMessageKey) {
    if (value==null) {
      return buildTranslate(context, errorMessageKey);
    }
    else if (value==false) {
      return buildTranslate(context, errorMessageKey);
    }
    else {
      return null;
    }
  }

  static checkBlankValidation(BuildContext context, dynamic value, String errorMessageKey) {
    if (value==null) {
      return buildTranslate(context, errorMessageKey);
    }
    else if (value is String) {
      if(value.isEmpty)
        return buildTranslate(context, errorMessageKey);
    }
    else {
      return null;
    }
  }

  static checkPasswordValidation(BuildContext context, String value, String enterPassword) {
    if (value.isEmpty) {
      return buildTranslate(context, enterPassword);
    }
    else if (value==null) {
      return buildTranslate(context, enterPassword);
    }
    else if (value.toString().trim().length<8) {
      return buildTranslate(context, "enterPassword");
    }
    else if (!Regex.password.hasMatch(value)) {
      return buildTranslate(context, "enterPassword");
    }
    else {
      return null;
    }
  }

  static checkConfirmPasswordValidation(BuildContext context, String value, String passwordMatch) {
    if (value.isEmpty) {
      return buildTranslate(context, "retypeNewPasswordHint");
    }
    else if (value==null) {
      return buildTranslate(context, "retypeNewPasswordHint");
    }
    else if (value.isNotEmpty && value!=passwordMatch) {
      return buildTranslate(context, "retypeNewPasswordMatchValidation");
    }
    else if (!Regex.password.hasMatch(value)) {
      return buildTranslate(context, "passwordValidValidation");
    }
    else {
      return null;
    }
  }
}