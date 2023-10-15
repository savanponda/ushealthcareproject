import 'package:flutter/material.dart';

dynamic changeScreen({required BuildContext context, required Widget widget}) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

void changePushReplacementScreen(
    {required BuildContext context, required Widget widget}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));
}

void changePushReplacementRemoveUntilScreen(
    {required BuildContext context, required Widget widget}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

void backToScreen({required BuildContext context}) {
  Navigator.pop(context);
}

void backToScreenWithArgument({
  required BuildContext context,
  required dynamic arguments,
}) {
  Navigator.pop(context, arguments);
}
