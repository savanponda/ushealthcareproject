import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/common/checkbox_tile.dart';
import 'package:onlinebia/apps/view/auth/signup_page.dart';
import 'package:onlinebia/apps/view/complate_profile_details/personal_details.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/SocialLoginButtonHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'package:onlinebia/utils/Utils.dart';
import 'forgot_password_page.dart';
import 'otp_page.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


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
  bool check1 = false;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        body: Stack(
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
                  buildTranslate(context, "HelloWelcomeBack"),
                  textAlign: TextAlign.left,
                  style: Fonts.titleStyle,
                ),
                SizedBox(height: 16,),
                Text(
                  buildTranslate(context, "HelloWelcomeBack1"),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.appLightBlack,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  'Email',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.appLightBlack,
                  ),
                ),
                SizedBox(height: 4,),
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
                Text(
                  'Password',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.appLightBlack,
                  ),
                ),
                SizedBox(height: 4,),

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBoxTile(
                      value: check1,
                      Title: 'Remember me',
                      callback: (bool value) {
                        setState(() {
                          check1 = value;
                        }
                        );

                      },
                      style: SafeGoogleFont (
                        'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBarText,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        NavigatorHelper.add(ForgotPasswordPage());
                      },
                      child: Text(
                        buildTranslate(context, "forgotPassword"),
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          color: AppColor.appBarText,
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
                             Timer(Duration(seconds: 0), () {
                                setState(() {
                                  animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                                });
                              });
                             Timer(Duration(seconds: 0), () {
                                setState(() {
                                  animatedButtonBloc.statusSink.add(AnimatedButtonStatus.NORMAL);
                                  NavigatorHelper.add(personalDetails());
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

                // Row(children: <Widget>[
                //   Expanded(
                //     child: new Container(
                //         margin: const EdgeInsets.only(left: 90.0, right: 20.0),
                //         child: Divider(
                //           color: Colors.black,
                //           height: 36,
                //         )),
                //   ),
                //   Text(buildTranslate(context, "or"),
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontStyle: FontStyle.normal,
                //       color: AppColor.appTitle,
                //       fontWeight: FontWeight.w500,
                //       fontFamily: "AppRegular",
                //     ),
                //   ),
                //   Expanded(
                //     child: new Container(
                //         margin:  EdgeInsets.only(left: 20.0, right: 90.0),
                //         child: Divider(
                //           color: Colors.black,
                //           height: 36,
                //         )),
                //   ),
                // ]),
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         // AuthController.instance.logInWithGoogle(context);
                //       },
                //       child: Container(
                //         height: 50,
                //         margin: const EdgeInsets.only(left: 80),
                //         child: SocialLoginButtonHelper.googleButton(context),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         // AuthController.instance.logInWithGoogle(context);
                //       },
                //       child: Container(
                //         height: 50,
                //         margin: const EdgeInsets.only(left: 40),
                //         child: SocialLoginButtonHelper.appleButton(context),
                //       ),
                //     ),
                //
                //   ],
                // ),
              ],
            ),
          ),
            Positioned(
              bottom: 30,
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
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
                        color: AppColor.appBarBottomText.withOpacity(0.6),
                        fontFamily: "AppSemiBold",
                      ),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        NavigatorHelper.add(SignUpPage());
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
        ]),

      ),
    );
  }
}






