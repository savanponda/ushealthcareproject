import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/auth/login_Screen.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:pinput/pinput.dart';

import 'forgot_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpIC = TextEditingController();
  FocusNode otpNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();

  @override
  Widget build(BuildContext context) {
    var defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1)),
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 241, 246, 1),
        border: Border.all(color: Color.fromRGBO(236, 241, 246, 1)),
        borderRadius: BorderRadius.circular(22),
      ),
    );
    return  Scaffold(
        body: KeyboardHideView(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        buildTranslate(context, "enterOTP"),
                        textAlign: TextAlign.center,
                        style: Fonts.titleStyle,
                      ),

                      Container(
                        margin:  EdgeInsets.all(15),
                        child: RichText(
                          textAlign: TextAlign.center,
                         text: TextSpan(
                           text: buildTranslate(context, "weHaveJustSentYou"),
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 14,
                               fontFamily: "AppRegular"
                           ),
                           children: [
                             TextSpan(text: buildTranslate(context, "johndiesel@gmail.com"), style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppRegular"
                           ),
                             )
                           ]
                         ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        validator: (s) {
                          return s == '2222' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
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
                                        NavigatorHelper.add(ForgotPassword());
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
                      //         NavigatorHelper.add(ForgotPassword());
                      //       },
                      //       buttonTextName: buildTranslate(context, "continue"),
                      //     ),
                      //   ),
                      // ),
                      WidgetHelper.getFieldSeparator(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buildTranslate(context, "dontreciveCode"),
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
                              NavigatorHelper.add(signInScreen());
                            },
                            child: Text(
                              buildTranslate(context, "resendOTP"),
                              style: Fonts.appBottomTitle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
