import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/TextView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';

import 'new_password_screen.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  TextEditingController emailIC = TextEditingController();
  FocusNode emailNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: KeyboardHideView(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      margin:  EdgeInsets.all(15),
                      child: Text(
                        buildTranslate(context, "recoverYourPass"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
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

                    StreamBuilder(
                        stream: animatedButtonBloc.statusStream,
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          return Hero(
                            tag: 'login',
                            child: Material(
                              elevation: 0,
                              child: AnimatedButton(
                                text: buildTranslate(context, "continue"),
                                status: snapshot.data??AnimatedButtonStatus.NORMAL,
                                onClick: (){
                                  animatedButtonBloc.statusSink.add(AnimatedButtonStatus.LOADING);
                                  Timer(Duration(seconds: 2), () {
                                    setState(() {
                                      animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                                    });
                                  });
                                  Timer(Duration(seconds: 3), () {
                                    setState(() {
                                      animatedButtonBloc.statusSink.add(AnimatedButtonStatus.NORMAL);
                                      NavigatorHelper.add(NewPasswordScreen());
                                    });
                                  });

                                },
                                textColor: Colors.white,
                              ),
                            ),
                          );
                        }
                    ),
                    // Hero(
                    //   tag:'login',
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
                    //         NavigatorHelper.add(NewPasswordScreen());
                    //       },
                    //       buttonTextName: buildTranslate(context, "continue"),
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
