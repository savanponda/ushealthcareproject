import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/view/auth/forgot_password_page.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/custom/StepperView.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/style/InputDecoration.dart';
import 'package:onlinebia/utils/Utils.dart';

class addressDetails extends StatefulWidget {
  const addressDetails({Key? key}) : super(key: key);

  @override
  State<addressDetails> createState() => _addressDetailsState();
}

class _addressDetailsState extends State<addressDetails> {

  TextEditingController dateinput = TextEditingController();
  TextEditingController emailIC = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController mobileNumberIC = TextEditingController();
  FocusNode mobileNumberNode = FocusNode();
  TextEditingController confirmIC = TextEditingController();
  TextEditingController passwordIC = TextEditingController();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmpasswordNode = FocusNode();
  bool _isObscure = false;
  var selectedState, selectedType;
  var selectedCity, selectedType1;
  List<String> _selectedCity = <String>[
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Mumbai'
  ];
  List<String> _selectedState = <String>[
    'Gujrat',
    'Maharashtra',
    'Rajasthan',
    'Uttarakhand'
  ];
  bool isObscure = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.only(top: 32, left: 22),
              child:Image(
                image:AssetsHelper.ushealcarenurses("arrow-left-BVK.png"),
                fit: BoxFit.cover,
                width: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 32),
              child: Text(
                buildTranslate(context, "GetstartedinThreesteps"),
                textAlign: TextAlign.center,
                style: Fonts.threeStepsStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, bottom: 32),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: StepperView(progress: 3, count: 3,
                  activecolor: AppColor.appColorLight,
                  deactivecolor: AppColor.appDivider,
                ),
              ),
            ),

            Container(
              margin:  EdgeInsets.fromLTRB(18, 10.0, 18, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    focusNode: emailNode,
                    controller: emailIC,
                    maxLines: 4,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "address"),
                    ),

                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkEmailValidation(context, value),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Zip code',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
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
                  Text(
                    'State',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),

                  DropdownButtonFormField(
                    items: _selectedState
                        .map((value) => DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Color(0xff666262)),
                      ),
                      value: value,
                    ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      print('$selectedAccountType');
                      setState(() {
                        selectedState = selectedAccountType;
                      });
                    },
                    value: selectedState,
                    isExpanded: true,
                    hint: Text(
                      'Select State',
                      style: TextStyle(color: Color(0xff666262)),
                    ),
                    decoration:CustomInputDecoration.getInputDecoration(
                      // hintText: buildTranslate(context, "phoneNo"),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'City',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),

                  DropdownButtonFormField(
                    items: _selectedCity
                        .map((value) => DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Color(0xff666262)),
                      ),
                      value: value,
                    ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      print('$selectedAccountType');
                      setState(() {
                        selectedCity = selectedAccountType;
                      });
                    },
                    value: selectedCity,
                    isExpanded: true,
                    hint: Text(
                      'Select City',
                      style: TextStyle(color: Color(0xff666262)),
                    ),
                    decoration:CustomInputDecoration.getInputDecoration(
                      // hintText: buildTranslate(context, "phoneNo"),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                ],
              ),
            ),

            Container(
              margin:  EdgeInsets.fromLTRB(15,10.0, 15, 10.0),
              child: ButtonView(
                color: AppColor.appColor,
                // textColor: AppColor.appBar,
                // borderColor:AppColor.appBar,
                textSize: 14,
                radius: 30,
                iconData: false,
                onPressed: () {
                  //Scaffold.of(context).hideCurrentSnackBar();
                  NavigatorHelper.add(ForgotPasswordPage());
                },
                buttonTextName: buildTranslate(context, "next"),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
