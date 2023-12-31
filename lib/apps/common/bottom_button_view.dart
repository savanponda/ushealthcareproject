import 'package:flutter/material.dart';
import 'package:UShealthcare/custom/ButtonView.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';

class BottomButtonView extends StatelessWidget {
  final String ButtonTitle;
  final Function callback;
  final bool deSelect;

  BottomButtonView({Key? key,
    required this.ButtonTitle,
    required this.callback,
    required this.deSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
      child: Container(
        height: 60,
        child: ButtonView(
          color: deSelect?AppColor.ButtonDeSelectbgcolor:AppColor.appColor,
          textColor: deSelect?AppColor.FieldTextColor:AppColor.Buttontext,
          borderColor:AppColor.appBarText,
          textSize: 16,
          radius: 30,
          iconData: true,
          onPressed: () {
            //Scaffold.of(context).hideCurrentSnackBar();
            callback();
            },
          buttonTextName: buildTranslate(context, ButtonTitle),
        ),
      ),
    );

  }
}