import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/custom/KeyboardHideView.dart';
import 'package:onlinebia/custom/TextView.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  TextEditingController passwordIC = TextEditingController();
  TextEditingController confirmIC = TextEditingController();
  bool _isObscure = false;
  bool isObscure = false;
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
                    // PromocodeTextView(),
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
                                      NavigatorHelper.add(TabBarScreen());
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
                    //         NavigatorHelper.add(TabBarScreen());
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
