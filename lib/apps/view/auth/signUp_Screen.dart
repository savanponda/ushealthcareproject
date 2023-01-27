import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/order_successful_page.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../custom/headerbar_page.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import 'login_Screen.dart';
import 'otp_screen.dart';


class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNamedIC = TextEditingController();
  TextEditingController lastNamedIC = TextEditingController();
  TextEditingController passwordIC = TextEditingController();
  TextEditingController mobileNumberIC = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  TextEditingController confirmIC = TextEditingController();
  bool _isObscure = false;
  bool isObscure = false;
  bool agree = false;
  FocusNode emailNode = FocusNode();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmpasswordNode = FocusNode();
  FocusNode mobileNumberNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();

  @override
  void dispose() {
    mobileNumberIC.dispose();
    passwordIC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardHideView(
        child: Center(
          child: SingleChildScrollView(

            child: Container(
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                      Text(
                        buildTranslate(context, "signUp"),
                        textAlign: TextAlign.center,
                        style: Fonts.titleStyle,
                      ),

                  Container(
                    margin:  EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 5.0),
                    child: Text(
                      buildTranslate(context, "createAccount"),
                      textAlign: TextAlign.center,
                      style: Fonts.titleDescription,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextView(
                    focusNode: firstNameNode,
                    controller: firstNamedIC,
                    // assetIcon:'Phone-Icon.png',
                    label: buildTranslate(context, "fName"),
                    //phoneIcon: true,
                    obscureText: false,
                    textInputAction: true,
                    textCapitalization: true,
                    inputFormatters: true,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextView(
                    focusNode: lastNameNode,
                    controller: lastNamedIC,
                    label: buildTranslate(context, "lName"),
                    obscureText: false,
                    textInputAction: true,
                    textCapitalization: true,
                    inputFormatters: true,
                    passwordIcon: false,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextView(
                    focusNode: mobileNumberNode,
                    controller: mobileNumberIC,
                    label: buildTranslate(context, "phoneNo"),
                    // phoneIcon: true,
                    mobileValidator: true,
                    textInputAction: true,
                    textCapitalization: true,
                    keyboardTypeNumber: true,
                    inputFormatters: true,
                  ),
                  WidgetHelper.getFieldSeparator(),
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
                  TextView(
                    focusNode: passwordNode,
                    btnClick:(){
                      setState(() {
                        _isObscure=!_isObscure;
                      });
                    },
                    controller:passwordIC,
                    // assetIcon:'Phone-Icon.png',
                    label: buildTranslate(context, "password"),
                    //phoneIcon: true,
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
                    // assetIcon:'Phone-Icon.png',
                    label: buildTranslate(context, "confirmPass"),
                    //phoneIcon: true,
                    obscureText: isObscure,
                    mobileValidator: true,
                    passwordIcon: true,
                    textInputAction: true,
                    textCapitalization: true,
                    inputFormatters: true,
                  ),
                  WidgetHelper.getFieldSeparator(),

                  WidgetHelper.getFieldSeparator(),
                  StreamBuilder(
                      stream: animatedButtonBloc.statusStream,
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        return Hero(
                          tag: 'login',
                          child: Material(
                            elevation: 0,
                            child: AnimatedButton(
                              text: buildTranslate(context, "signUp"),
                              status: snapshot.data??AnimatedButtonStatus.NORMAL,
                              onClick: (){
                                animatedButtonBloc.statusSink.add(AnimatedButtonStatus.LOADING);
                                Timer(Duration(seconds: 2), () {
                                  setState(() {
                                    animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                                    NavigatorHelper.add(OTPScreen());
                                  });
                                });

                              },
                              backgroundColor: AppColor.appColor,
                              textColor: Colors.white,
                            ),
                          ),
                        );
                      }
                  ),
                  // Hero(
                  //   tag: 'login',
                  //   child: Material(
                  //     elevation: 0,
                  //     child: ButtonView(
                  //       color: AppColor.appColor,
                  //       textColor: AppColor.Buttontext,
                  //       borderColor:AppColor.appBarText,
                  //       textSize: 16,
                  //       radius: 30,
                  //       iconData: false,
                  //       onPressed: () {
                  //         //Scaffold.of(context).hideCurrentSnackBar();
                  //         NavigatorHelper.add(OTPScreen());
                  //       },
                  //       buttonTextName: buildTranslate(context, "signUp"),
                  //     ),
                  //   ),
                  // ),
                  WidgetHelper.getFieldSeparator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buildTranslate(context, "alreadyHaveAccount"),
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
                          NavigatorHelper.add(HeaderbarPage());
                        },
                        child: Text(
                          buildTranslate(context, "signIn"),
                          style: Fonts.appBottomTitle,
                        ),
                      ),
                    ],
                  ),
                  WidgetHelper.getFieldSeparator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}