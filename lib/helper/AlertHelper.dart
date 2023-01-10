import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/AppColor.dart';
import '../utils/Constants.dart';
import 'NavigatorHelper.dart';

class AlertHelper {

  static showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.appColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showAlert(){
    showCupertinoDialog<String>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Need to add Business'),
        content: const Text('Currently your business detail are unavailable. You need to add/select business to make post.?', style: TextStyle(
          fontSize: 14,

        ),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel', style: TextStyle(
              fontSize: 14,
              fontFamily: "AppSemiBold",
            ),),
          ),
          TextButton(
            onPressed: () {

            },
            child: const Text('OK', style: TextStyle(
              fontSize: 14,
              fontFamily: "AppSemiBold",
            ),),
          ),
        ],
      ),
    );
  }
}