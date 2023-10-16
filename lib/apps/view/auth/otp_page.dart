import 'dart:async';
import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/auth/signin_page.dart';
import 'package:UShealthcare/apps/view/bottom_navigation/tab_bar_page.dart';
import 'package:UShealthcare/custom/KeyboardHideView.dart';
import 'package:UShealthcare/custom/animated_button.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/Fonts.dart';
import 'package:pinput/pinput.dart';


class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

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
                               color: AppColor.appBarBottomText,
                               fontSize: 14,
                               fontWeight: FontWeight.w500,
                               fontFamily: "AppRegular"
                           ),
                           children: [
                             TextSpan(text: buildTranslate(context, "johndiesel@gmail.com"), style: TextStyle(
                            color: AppColor.appBarText,
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
                      WidgetHelper.getFieldSeparator(height: 30),

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
                                    Timer(Duration(seconds: 0), () {
                                      setState(() {
                                        animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                                      });
                                    });
                                    Timer(Duration(seconds: 0), () {
                                      setState(() {
                                        animatedButtonBloc.statusSink.add(AnimatedButtonStatus.NORMAL);
                                        NavigatorHelper.add(TabBarPage());
                                      });
                                    });

                                  },
                                  textColor: Colors.white,
                                ),
                              ),
                            );
                          }
                      ),
                      WidgetHelper.getFieldSeparator(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buildTranslate(context, "dontreciveCode"),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: AppColor.appBarBottomText,
                              fontFamily: "AppSemiBold",
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              NavigatorHelper.add(SignInPage());
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
