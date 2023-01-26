import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/auth/signUp_Screen.dart';
import 'package:onlinebia/custom/animated_button.dart';
import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/SocialLoginButtonHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import 'forgot_password_screen.dart';


class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordIC = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  bool _isObscure = true;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();



  save() async{
    Timer(Duration(seconds: 2), () {
      setState(() {
        animatedButtonBloc.statusSink.add(AnimatedButtonStatus.LOADING);
      });
    });
  }
  void initState() {
    super.initState();
    save();
  }
  @override
  void dispose() {
    emailIC.dispose();
    passwordIC.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buildTranslate(context, "signIn"),
                textAlign: TextAlign.center,
                style: Fonts.titleStyle,
              ),
              SizedBox(height: 20,),
              TextView(
                focusNode: emailNode,
                controller: emailIC,
                // assetIcon:'Phone-Icon.png',
                label: buildTranslate(context, "Email"),
                //phoneIcon: true,
                obscureText: false,
                emailValidator: true,
                textInputAction: true,
                textCapitalization: true,
                keyboardTypeEmail: true,
                inputFormatters: true,
              ),
              WidgetHelper.getFieldSeparator(),
              TextView(
                focusNode: passwordNode,
                controller:passwordIC,
                passwordIcon: true,
                // assetIcon:'Phone-Icon.png',
                btnClick:(){
                  setState(() {
                    _isObscure=!_isObscure;
                  });
                },
                label: buildTranslate(context, "password"),
                //phoneIcon: true,
                obscureText: _isObscure,
                mobileValidator: true,
                textInputAction: true,
                textCapitalization: true,
                inputFormatters: true,
              ),
              WidgetHelper.getFieldSeparator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      NavigatorHelper.add(ForgotPassword());
                    },
                    child: Text(
                      buildTranslate(context, "forgotPassword"),
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: AppColor.appErrorText,
                        fontWeight: FontWeight.w500,
                        fontFamily: "AppSemiBold",
                      ),
                    ),
                  ),
                ],
              ),
              WidgetHelper.getFieldSeparator(),
              Hero(
                tag: 'login',
                child: Material(
                  elevation: 0,
                  child: ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 16,
                    radius: 30,
                    iconData: false,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.add(signUpScreen());
                    },
                    buttonTextName: buildTranslate(context, "signIn"),
                  ),
                ),
              ),
              WidgetHelper.getFieldSeparator(),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 90.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 90.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),
              Row(

                children: [
                  GestureDetector(
                    onTap: () {
                      // AuthController.instance.logInWithGoogle(context);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 90),
                      child: SocialLoginButtonHelper.googleButton(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // AuthController.instance.logInWithGoogle(context);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 40),
                      child: SocialLoginButtonHelper.appleButton(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buildTranslate(context, "don'tHaveAccount"),
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: AppColor.appLightBlack,
                  fontFamily: "AppSemiBold",
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  NavigatorHelper.add(signUpScreen());
                },
                child: Text(
                  buildTranslate(context, "signUp"),
                  style: Fonts.appBottomTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






