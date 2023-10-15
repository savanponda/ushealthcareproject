import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'package:onlinebia/utils/Utils.dart';

import 'new_password_page.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {


  TextEditingController emailIC = TextEditingController();
  FocusNode emailNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 22),
                child:Image(
                  image:AssetsHelper.ushealcarenurses("arrow-left-BVK.png"),
                  fit: BoxFit.cover,
                  width: 30,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buildTranslate(context, "forgotPassword"),
                      style: Fonts.titleStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        buildTranslate(context, "recoverYourPass"),
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: AppColor.appLightBlack,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text(
                      'Email Address',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColor.appLightBlack,
                      ),
                    ),
                    WidgetHelper.getFieldSeparator(),

                    TextFormField(
                      focusNode: emailNode,
                      controller: emailIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "email"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkEmailValidation(context, value),
                      textInputAction: TextInputAction.next,
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
                                text: buildTranslate(context, "sendCode"),
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
                                      NavigatorHelper.add(NewPasswordPage());
                                    });
                                  });

                                },
                                textColor: Colors.white,
                              ),
                            ),
                          );
                        }
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
