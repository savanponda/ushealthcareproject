import 'package:flutter/material.dart';
import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import '../menu/bottom_BarScreen.dart';
import 'login_Screen.dart';


class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordIC = TextEditingController();
  TextEditingController mobileNumberIC = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  TextEditingController nameIC = TextEditingController();
  bool _isObscure = false;
  bool agree = false;
  FocusNode emailNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode mobileNumberNode = FocusNode();


  @override
  void dispose() {
    mobileNumberIC.dispose();
    passwordIC.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    buildTranslate(context, "signUp"),
                    style: Fonts.headerStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    buildTranslate(context, "createAccountEnjoyServices"),
                    style: Fonts.appBottomTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextView(
                    focusNode: nameNode,
                    controller: nameIC,
                    label: buildTranslate(context, "enterName"),
                    userIcon: true,
                    textInputAction: true,
                    textCapitalization: true,
                    inputFormatters: true,
                    keyboardTypetext: true,
                    assetIcon:'User.png',
                  ),

                  WidgetHelper.getFieldSeparator(),
                  TextView(
                    focusNode: mobileNumberNode,
                    controller: mobileNumberIC,
                    label: buildTranslate(context, "enterPhoneNo"),
                    phoneIcon: true,
                    mobileValidator: true,
                    textInputAction: true,
                    textCapitalization: true,
                    keyboardTypeNumber: true,
                    inputFormatters: true,
                    assetIcon:'Phone-Icon.png',
                  ),

                  WidgetHelper.getFieldSeparator(),
                  TextView(
                    focusNode: emailNode,
                    controller: emailIC,
                    label: buildTranslate(context, "enterEmail"),
                    emailIcon: true,
                    emailValidator: true,
                    textInputAction: true,
                    textCapitalization: true,
                    keyboardTypeEmail: true,
                    assetIcon:'Mail.png',

                  ),

                  WidgetHelper.getFieldSeparator(),
                  TextView(

                    controller: passwordIC,
                    btnClick:(){
                      setState(() {
                        _isObscure=!_isObscure;
                      });

                    },
                    label: buildTranslate(context, "enterPassword"),
                    passwordIcon: true,
                    obscureText: _isObscure,
                    textInputAction: true,
                    textCapitalization: true,
                    passwordValidator: true,
                    keyboardTypetext: true,
                    inputFormatters: true,
                    assetIcon:'Lock-Icon.png',
                  ),
                  SizedBox(height: 20,),
                  Row(

                    children: [
                      Checkbox(
                          value: agree,
                          onChanged: (value){
                            setState((){
                              agree = value!;
                            });

                          }
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: buildTranslate(context, "iAgree"),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: "AppRegular"
                            ),
                            children: <TextSpan>[
                              TextSpan(text: buildTranslate(context, "termsCondition"), style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "AppRegular"
                              ),

                              ),
                              TextSpan(text: " and ", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "AppRegular"
                              ),),
                              TextSpan(text: buildTranslate(context, "privacyPolicy"), style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "AppRegular"
                              ),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   child: CheckboxListTile( //checkbox positioned at left
                  //     value: agree,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     onChanged: (bool? value) {
                  //       setState(() {
                  //         agree = value!;
                  //       });
                  //     },
                  //     title: //Text(buildTranslate(context, "termsCondition"), style: Fonts.appBottomTextStyle,),
                  //   ),
                  // ),
                  WidgetHelper.getFieldSeparator(),
                  Container(
                    child: ButtonView(
                      color: AppColor.appColor,
                      textColor: AppColor.appBar,
                      borderColor:AppColor.appBar,
                      textSize: 16,
                      radius: 30,
                      iconData: false,
                      onPressed: () {
                        //Scaffold.of(context).hideCurrentSnackBar();
                        // NavigatorHelper.add(TabBarScreen());
                      },
                      buttonTextName: buildTranslate(context, "signUp"),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: 70.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buildTranslate(context, "haveAccount"),
                          style: Fonts.appBottomTextStyle,
                        ),

                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            // NavigatorHelper.add(signInScreen());
                          },
                          child: Text(
                            buildTranslate(context, "signIn"),
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              color: AppColor.appColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: "AppSemiBold",
                            ),
                          ),
                        ),
                      ],
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