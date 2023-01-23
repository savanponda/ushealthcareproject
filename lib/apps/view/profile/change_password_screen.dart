import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/notification/notifications_Screen.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/custom/TextView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override

  bool _isObscure = false;
  bool isObscure = false;
  FocusNode passwordNode = FocusNode();
  FocusNode confirmpasswordNode = FocusNode();
  TextEditingController passwordIC = TextEditingController();
  TextEditingController confirmIC = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "changePassword"),
          centerTitle: true,
          showBackIcon: true,
          showNotificationIcon: false,
          onAddressClick: (){
          }
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(height: 34,),
              TextView(
                focusNode: passwordNode,
                btnClick:(){
                  setState(() {
                    _isObscure=!_isObscure;
                  });
                },
                controller:passwordIC,
                label: buildTranslate(context, "password"),
                obscureText: _isObscure,
                mobileValidator: true,
                passwordIcon: true,
                textInputAction: true,
                textCapitalization: true,
                inputFormatters: true,
              ),
              WidgetHelper.getFieldSeparator(),
              TextView(
                focusNode: confirmpasswordNode,
                btnClick:(){
                  setState(() {
                    isObscure=!isObscure;
                  });
                },
                controller:confirmIC,
                label: buildTranslate(context, "confirmPass"),
                obscureText: isObscure,
                mobileValidator: true,
                passwordIcon: true,
                textInputAction: true,
                textCapitalization: true,
                inputFormatters: true,
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
                  NavigatorHelper.add(NotificationScreen());
                },
                buttonTextName: buildTranslate(context, "changePassword"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
