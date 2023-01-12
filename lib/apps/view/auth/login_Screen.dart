import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/auth/signUp_Screen.dart';
import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';


class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordIC = TextEditingController();
  TextEditingController mobileNumberIC = TextEditingController();
  bool _isObscure = true;
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 20, top: 80),
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    buildTranslate(context, "skip"),
                    // style: Fonts.titlebottomStyle,
                  )
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        buildTranslate(context, "welcome!"),
                        style: Fonts.headerStyle,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        buildTranslate(context, "signInToAccount"),
                        style: Fonts.appBottomTextStyle,
                      ),
                      SizedBox(height: 20,),
                      TextView(
                        focusNode: mobileNumberNode,
                        controller: mobileNumberIC,
                        assetIcon:'Phone-Icon.png',
                        label: buildTranslate(context, "enterPhoneNo"),
                        //phoneIcon: true,
                        obscureText: false,
                        mobileValidator: true,
                        textInputAction: true,
                        textCapitalization: true,
                        keyboardTypeNumber: true,
                        inputFormatters: true,
                      ),
                      WidgetHelper.getFieldSeparator(),
                      TextView(

                        controller: passwordIC,
                        btnClick:(){
                          setState(() {
                            _isObscure=!_isObscure;
                          });

                        },
                        assetIcon:'Lock-Icon.png',
                        label: buildTranslate(context, "enterPassword"),
                        passwordIcon: true,
                        obscureText: _isObscure,
                        textInputAction: true,
                        passwordValidator: true,
                        textCapitalization: true,
                        keyboardTypetext: true,
                      ),
                      WidgetHelper.getFieldSeparator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            // onTap: (){
                            //   NavigatorHelper.add(ForgotPassword());
                            // },
                            child: Text(
                              buildTranslate(context, "forgotPassword"),
                              // style: Fonts.titlebottomStyle,
                            ),
                          ),
                        ],
                      ),
                      WidgetHelper.getFieldSeparator(),
                      ButtonView(
                        color: AppColor.appColor,
                        textColor: Colors.white,
                        borderColor:AppColor.appColor,
                        textSize: 16,
                        radius: 30,
                        iconData: false,
                        onPressed: () {
                          //Scaffold.of(context).hideCurrentSnackBar();
                          NavigatorHelper.add(signUpScreen());
                        },
                        buttonTextName: buildTranslate(context, "signIn"),
                      ),


                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: kToolbarHeight,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buildTranslate(context, "don'tHaveAccount"),
                        style: Fonts.appBottomTextStyle,
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          // NavigatorHelper.add(PaymentMethodScreen());
                        },
                        child: Text(
                          buildTranslate(context, "signUp"),
                          // style: Fonts.titlebottomStyle,
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
    );
  }
}






