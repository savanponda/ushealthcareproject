import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/view/bottom_navigation/tab_bar_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';



class PromocodeTextView extends StatelessWidget {

  PromocodeTextView({
    Key? key,
    this.label,
    this.phoneIcon = false,
    this.passwordIcon = false,
    this.assetIcon,
    this.emailIcon = false,
    this.userIcon = false,
    this.controller,
    this.focusNode,
    this.isValid,
    this.invalidMsg,
    this.obscureText = false,
    this.textInputAction = false,
    this.keyboardTypetext = false,
    this.keyboardTypeEmail = false,
    this.keyboardTypeNumber = false,
    this.textCapitalization = false,
    this.obscuringCharacter = false,
    this.inputFormatters = false,
    this.emailValidator = false,
    this.mobileValidator = false,
    this.passwordValidator = false,
    this.assetImage,
    this.btnClick,
    this.secureClick,

  }) : super(key: key);

  final String? label;
  final Function? btnClick;
  final Function? secureClick;
  final String? assetImage;
  final bool phoneIcon;
  final bool emailValidator;
  final bool mobileValidator;
  final bool passwordValidator;
  final bool passwordIcon;
  final bool emailIcon;
  final bool userIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isValid;
  final String? invalidMsg;
  late bool obscureText;
  final bool textInputAction;
  final String? assetIcon;
  final bool keyboardTypetext;
  final bool keyboardTypeEmail;
  final bool keyboardTypeNumber;
  final bool textCapitalization;
  final bool obscuringCharacter;
  final bool inputFormatters;

  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
          color: AppColor.appDivider,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          SizedBox(width: 12,),
          Expanded(
            child: Container(
              child: TextFormField(
                style: Fonts.fieldStyle,
                decoration: InputDecoration(
                  hintText: "Enter Your Promo Code",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appDivider),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appDivider),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appDivider),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                controller: controller,
                textInputAction: TextInputAction.next,
                keyboardType: keyboardTypeEmail?TextInputType.emailAddress
                    :keyboardTypeNumber?TextInputType.number
                    :keyboardTypetext?TextInputType.text:null,
                textCapitalization: TextCapitalization.words,
                obscuringCharacter: "*",
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                validator: (value) => mobileValidator?
                ValidationHelper.checkMobileNoValidation(context, value!)
                    :emailValidator?ValidationHelper.checkEmailValidation(context, value)
                    :passwordValidator?ValidationHelper.checkPasswordValidation(context, value!, "Error"):null,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              NavigatorHelper.addWithAnimation(TabBarPage());
            },
            child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Text("ADD",style: TextStyle(color:Colors.deepOrange),)
            ),
          ),
        ],
      ),
    );
  }
}