import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'signin_page.dart';
import 'otp_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


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
                      style: Fonts.titleStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    focusNode: firstNameNode,
                    controller: firstNamedIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "fName"),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),

                  TextFormField(
                    focusNode: lastNameNode,
                    controller: lastNamedIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "lName"),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),

                  TextFormField(
                    focusNode: mobileNumberNode,
                    controller: mobileNumberIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "phoneNo"),
                    ),
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkMobileNoValidation(context,value!),
                    textInputAction: TextInputAction.next,
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
                                Timer(Duration(seconds: 0), () {
                                  setState(() {
                                    animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                                  });
                                });
                                Timer(Duration(seconds: 0), () {
                                  setState(() {
                                    animatedButtonBloc.statusSink.add(AnimatedButtonStatus.NORMAL);
                                    NavigatorHelper.add(OTPPage());
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
                          NavigatorHelper.add(SignInPage());
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