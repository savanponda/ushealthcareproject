import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UShealthcare/apps/view/notification/notifications_page.dart';
import 'package:UShealthcare/custom/ButtonView.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/ValidationHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/InputDecoration.dart';

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
