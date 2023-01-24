import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/custom/promocode_textview.dart';

import '../../../custom/ButtonView.dart';
import '../../../custom/TextView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, ""),
            centerTitle: true,
            showBackIcon: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
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
                    buildTranslate(context, "createaNewPassword"),
                    textAlign: TextAlign.center,
                    style: Fonts.titleStyle,
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
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
                  ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 16,
                    radius: 30,
                    iconData: false,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.add(TabBarScreen());
                    },
                    buttonTextName: buildTranslate(context, "continue"),
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
