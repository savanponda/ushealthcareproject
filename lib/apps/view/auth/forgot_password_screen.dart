import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import 'new_password_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  TextEditingController emailIC = TextEditingController();
  FocusNode emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, ""),
            centerTitle: true,
            showBackIcon: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buildTranslate(context, "forgotPassword"),
                    textAlign: TextAlign.center,
                    style: Fonts.titleStyle,
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                    child: Text(
                      buildTranslate(context, "recoverYourPass"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: AppColor.appLightBlack,
                        fontFamily: "AppSemiBold",
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextView(
                    focusNode: emailNode,
                    controller: emailIC,
                    label: buildTranslate(context, "email"),
                    emailValidator: true,
                    textInputAction: true,
                    textCapitalization: true,
                    keyboardTypeEmail: true,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  WidgetHelper.getFieldSeparator(),
                  WidgetHelper.getFieldSeparator(),
                  ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 16,
                    radius: 30,
                    iconData: false,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.add(NewPasswordScreen());
                    },
                    buttonTextName: buildTranslate(context, "continue"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
