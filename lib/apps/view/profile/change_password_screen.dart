import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/view/notification/notifications_page.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/InputDecoration.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override

  bool _isObscure = false;
  bool isObscure = false;
  bool agree = false;
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
              TextFormField(
                obscureText: _isObscure,
                focusNode: passwordNode,
                controller:passwordIC,
                decoration:CustomInputDecoration.getInputDecoration(
                    hintText: buildTranslate(context, "password"),
                    passwordIcon: true,
                    obscureText: _isObscure,
                    secureClick: (){
                      setState(() {
                        _isObscure=!_isObscure;
                      });
                    }
                ),
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                validator: (value) =>ValidationHelper.checkPasswordValidation(context, value!,"Error"),
                textInputAction: TextInputAction.next,
              ),
              WidgetHelper.getFieldSeparator(),
              TextFormField(
                obscureText: agree,
                focusNode: confirmpasswordNode,
                controller:confirmIC,
                decoration:CustomInputDecoration.getInputDecoration(
                    hintText: buildTranslate(context, "confirmPass"),
                    passwordIcon: true,
                    obscureText: agree,
                    secureClick: (){
                      setState(() {
                        agree=!agree;
                      });
                    }
                ),
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                validator: (value) =>ValidationHelper.checkPasswordValidation(context, value!,"Error"),
                textInputAction: TextInputAction.next,
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
                  NavigatorHelper.add(NotificationPage());
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
