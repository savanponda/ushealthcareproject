import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/view/auth/signUp_Screen.dart';
import 'package:onlinebia/apps/view/filter/filter_page.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/SocialLoginButtonHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'forgot_password_screen.dart';


class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {


  TextEditingController passwordIC = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  bool _isObscure = true;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();


  void initState() {
    super.initState();
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

              TextFormField(
                focusNode: emailNode,
                controller: emailIC,
                decoration:CustomInputDecoration.getInputDecoration(
                  hintText: buildTranslate(context, "Email"),
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
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        color: AppColor.appErrorText,
                        fontWeight: FontWeight.w600,
                        fontFamily: "AppSemiBold",
                      ),
                    ),
                  ),
                ],
              ),
              WidgetHelper.getFieldSeparator(),
              StreamBuilder(
                  stream: animatedButtonBloc.statusStream,
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    return Hero(
                      tag: 'login',
                      child: Material(
                        elevation: 0,
                        child: AnimatedButton(
                          text: buildTranslate(context, "signIn"),
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
                                NavigatorHelper.add(signUpScreen());
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
              //         NavigatorHelper.add(signUpScreen());
              //       },
              //       buttonTextName: buildTranslate(context, "signIn"),
              //     ),
              //   ),
              // ),
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
                Text(buildTranslate(context, "or"),),
                Expanded(
                  child: new Container(
                      margin:  EdgeInsets.only(left: 20.0, right: 90.0),
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
                      margin: const EdgeInsets.only(left: 80),
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
                  fontSize: 16,
                  color: AppColor.appLightBlack,
                  fontFamily: "AppSemiBold",
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  NavigatorHelper.add(FilterPage());
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






