import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:onlinebia/apps/common/checkbox_tile.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'package:onlinebia/utils/Utils.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController passwordIC = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  bool _isObscure = true;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();

  bool check1 = false;
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
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: TextButton(
          // login8Pj (1102:19543)
          onPressed: () {},
          style: TextButton.styleFrom (
            padding: EdgeInsets.zero,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(22*fem, 21.5*fem, 28*fem, 8*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32,),
                Container(
                  // arrowleft4Tj (1334:33390)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 354*fem, 24*fem),
                  width: 24*fem,
                  height: 24*fem,
                  child: Image.asset(
                    'assets/ushealcarenurses/arrow-left-BVK.png',
                    width: 24*fem,
                    height: 24*fem,
                  ),
                ),
                Container(
                  // labelkrM (1102:19586)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 126*fem, 16*fem),
                  constraints: BoxConstraints (
                    maxWidth: 240*fem,
                  ),
                  child: Text(
                    'Hello!\nWelcome Back',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 32*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.25*ffem/fem,
                      color: Color(0xff434344),
                    ),
                  ),
                ),
                Container(
                  // label2os (1102:19587)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 32*fem),
                  constraints: BoxConstraints (
                    maxWidth: 342*fem,
                  ),
                  child: Text(
                    'Let’s get you logged in to get back to accepting shifts and adding more value to your ratings',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: Color(0xff828282),
                    ),
                  ),
                ),
                Container(
                  // inputfieldGCR (1102:19576)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // inputfieldbEh (1102:19577)
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // label8VX (I1102:19577;11:453)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                              child: Text(
                                buildTranslate(context, "Email"),
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5714285714*ffem/fem,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                            ),
                            Container(
                              // inputqPw (I1102:19577;11:446)
                              // padding: EdgeInsets.fromLTRB(14*fem, 15*fem, 14*fem, 15*fem),
                              width: double.infinity,
                              decoration: BoxDecoration (
                                border: Border.all(color: Color(0xffededed)),
                                borderRadius: BorderRadius.circular(5*fem),
                              ),
                              child: TextFormField(
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20*fem,
                      ),
                      Container(
                        // inputfieldH13 (1102:19578)
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // label2DX (I1102:19578;11:536)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                              child: Text(
                                'Password',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5714285714*ffem/fem,
                                  color: Color(0xffa2a5b1),
                                ),
                              ),
                            ),
                            Container(
                              // input9J9 (I1102:19578;11:507)
                              // padding: EdgeInsets.fromLTRB(12*fem, 15*fem, 12*fem, 15*fem),
                              width: double.infinity,
                              decoration: BoxDecoration (
                                border: Border.all(color: Color(0xffededed)),
                                borderRadius: BorderRadius.circular(5*fem),
                              ),
                              child: TextFormField(
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20*fem,
                      ),
                      Container(
                        // checkboxrLy (1102:19579)
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // checkboxQNV (1102:19580)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: CheckBoxTile(
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
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5714285714*ffem/fem,
                                    color: Color(0xff434344),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              // forgotpassword1dB (1102:19582)
                              'Forgot password?',
                              textAlign: TextAlign.right,
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5714285714*ffem/fem,
                                color: Color(0xff434344),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // buttonwmj (1102:19583)
                  width: double.infinity,
                  height: 53*fem,
                  decoration: BoxDecoration (
                    color: Color(0xff0075db),
                    borderRadius: BorderRadius.circular(4*fem),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}