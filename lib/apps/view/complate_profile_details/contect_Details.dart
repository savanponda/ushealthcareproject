import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:UShealthcare/apps/view/complate_profile_details/address.dart';
import 'package:UShealthcare/apps/view/complate_profile_details/contect_Details.dart';
import 'package:UShealthcare/custom/ButtonView.dart';
import 'package:UShealthcare/custom/StepperView.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/ValidationHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/Fonts.dart';
import 'package:UShealthcare/style/InputDecoration.dart';
import 'package:UShealthcare/utils/Utils.dart';

class contectDetails extends StatefulWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String dob;
  contectDetails(
      {Key? key,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.dob})
      : super(key: key);

  @override
  State<contectDetails> createState() => _contectDetailsState();
}

class _contectDetailsState extends State<contectDetails> {
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
              child: Image(
                image: AssetsHelper.ushealcarenurses("arrow-left-BVK.png"),
                fit: BoxFit.cover,
                width: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22, left: 32),
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
                child: StepperView(
                  progress: 2,
                  count: 3,
                  activecolor: AppColor.appColorLight,
                  deactivecolor: AppColor.appDivider,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18, 10.0, 18, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 10),
                  TextFormField(
                    focusNode: emailNode,
                    controller: emailIC,
                    decoration: CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "lName"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>
                        ValidationHelper.checkEmailValidation(context, value),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Phone No',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 10),
                  TextFormField(
                    focusNode: mobileNumberNode,
                    controller: mobileNumberIC,
                    decoration: CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "phoneNo"),
                    ),
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>
                        ValidationHelper.checkMobileNoValidation(
                            context, value!),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Password',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 10),
                  TextFormField(
                    obscureText: _isObscure,
                    focusNode: passwordNode,
                    controller: passwordIC,
                    decoration: CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "password"),
                        passwordIcon: true,
                        obscureText: _isObscure,
                        secureClick: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    keyboardType: TextInputType.visiblePassword,
                    obscuringCharacter: "*",
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>
                        ValidationHelper.checkPasswordValidation(
                            context, value!, "Error"),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Confirm Password',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 10),
                  TextFormField(
                    obscureText: agree,
                    focusNode: confirmpasswordNode,
                    controller: confirmIC,
                    decoration: CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "confirmPass"),
                        passwordIcon: true,
                        obscureText: agree,
                        secureClick: () {
                          setState(() {
                            agree = !agree;
                          });
                        }),
                    keyboardType: TextInputType.visiblePassword,
                    obscuringCharacter: "*",
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>
                        ValidationHelper.checkPasswordValidation(
                            context, value!, "Error"),
                    textInputAction: TextInputAction.next,
                  ),
                  WidgetHelper.getFieldSeparator(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 10.0, 15, 10.0),
              child: ButtonView(
                color: AppColor.appColor,
                // textColor: AppColor.appBar,
                // borderColor:AppColor.appBar,
                textSize: 14,
                radius: 30,
                iconData: false,
                onPressed: () {
                  print("===dob==${widget.dob}");
                  print("===email==${emailIC.text}");
                  print("===firstame==${widget.firstName}");
                  print("===lastname==${widget.lastName}");
                  print("===middlename==${widget.middleName}");
                  print("===password==${ passwordIC.text}");
                  print("===mobile==${mobileNumberIC.text}");
                
                  //Scaffold.of(context).hideCurrentSnackBar();
                  NavigatorHelper.add(addressDetails(
                    dob: widget.dob,
                    email: emailIC.text,
                    firstName: widget.firstName,
                    lastName: widget.lastName,
                    middleName: widget.middleName,
                    password: passwordIC.text,
                    phoneNo: mobileNumberIC.text,
                  ));
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
