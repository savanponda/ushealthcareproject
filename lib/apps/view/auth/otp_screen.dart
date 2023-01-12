import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../custom/ButtonView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import 'forgot_password_screen.dart';
import 'login_Screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpIC = TextEditingController();
  FocusNode otpNode = FocusNode();
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                    buildTranslate(context, "enterOTP"),
                    textAlign: TextAlign.center,
                    style: Fonts.titleStyle,
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 5.0),
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
                         TextSpan(text: buildTranslate(context, "+91 89562 59587"), style: TextStyle(
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
                  ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 16,
                    radius: 30,
                    iconData: false,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.add(ForgotPassword());
                    },
                    buttonTextName: buildTranslate(context, "continue"),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Positioned(
                    bottom: kToolbarHeight,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
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
                    ),
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
