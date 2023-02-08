import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/view/auth/signin_page.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

  TextEditingController passwordIC = TextEditingController();
  TextEditingController confirmIC = TextEditingController();
  bool _isObscure = false;
  bool isObscure = false;
  bool agree = false;
  FocusNode passwordNode = FocusNode();
  FocusNode confirmpasswordNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context,""),
            centerTitle: true,
            showBackIcon: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: KeyboardHideView(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      buildTranslate(context, "createaNewPassword"),
                      textAlign: TextAlign.center,
                      style: Fonts.titleStyle,
                    ),
                    Container(
                      margin:  EdgeInsets.all(15),
                      child: Text(
                        buildTranslate(context, "enteryourNewPass"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: AppColor.appLightBlack,
                          fontFamily: "AppSemiBold",
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

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
                    WidgetHelper.getFieldSeparator(height: 50),


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
                                      NavigatorHelper.add(SignInPage());
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
            ),
          ),
        ),
      );
  }
}
