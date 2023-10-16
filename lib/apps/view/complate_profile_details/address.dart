import 'package:UShealthcare/apps/view/menu/bottom_BarScreen.dart';
import 'package:UShealthcare/apps/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UShealthcare/apps/view/auth/forgot_password_page.dart';
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
import 'package:UShealthcare/apps/auth_provider/auth_provider.dart';
import 'package:provider/provider.dart';

class addressDetails extends StatefulWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String dob;
  final String email;
  final String phoneNo;
  final String password;
  addressDetails(
      {Key? key,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.dob,
      required this.email,
      required this.phoneNo,
      required this.password})
      : super(key: key);

  @override
  State<addressDetails> createState() => _addressDetailsState();
}

class _addressDetailsState extends State<addressDetails> {
  TextEditingController addressInput = TextEditingController();
  TextEditingController zipCodeInput = TextEditingController();
  var selectedState, selectedType;
  var selectedCity, selectedType1;
  List<dynamic> _selectedCity = ['Rajkot', 'Ahmedabad', 'Surat', 'Mumbai'];
  List<dynamic> _selectedState = [
    'Gujrat',
    'Maharashtra',
    'Rajasthan',
    'Uttarakhand'
  ];
  bool isObscure = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthProvider _authProvider, snapshot) {
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
                    progress: 3,
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
                      'Address',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F3437),
                      ),
                    ),
                    WidgetHelper.getFieldSeparator(height: 10),
                    TextFormField(
                      controller: addressInput,
                      maxLines: 4,
                      decoration: CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "address"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>
                          ValidationHelper.checkEmailValidation(context, value),
                      textInputAction: TextInputAction.next,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    Text(
                      'Zip code',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F3437),
                      ),
                    ),
                    WidgetHelper.getFieldSeparator(height: 10),
                    TextFormField(
                      controller: zipCodeInput,
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
                      'State',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F3437),
                      ),
                    ),
                    WidgetHelper.getFieldSeparator(height: 10),
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
                      decoration: CustomInputDecoration.getInputDecoration(
                          // hintText: buildTranslate(context, "phoneNo"),
                          ),
                    ),
                    WidgetHelper.getFieldSeparator(),
                    Text(
                      'City',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F3437),
                      ),
                    ),
                    WidgetHelper.getFieldSeparator(height: 10),
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
                      decoration: CustomInputDecoration.getInputDecoration(
                          // hintText: buildTranslate(context, "phoneNo"),
                          ),
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
                  onPressed: () async {
                    print("===address==${addressInput.text}");
                    print("===dob==${widget.dob.toString()}");
                    print("===cityid==${1}");
                    print("===email==${widget.email.toString()}");
                    print("====firstname==${widget.firstName.toString()}");
                    print("===middlename==${widget.middleName.toString()}");
                    print("===lastname===${widget.lastName.toString()}");
                    print("===password==${widget.password.toString()}");
                    print("===mobile==${widget.phoneNo.toString()}");
                    print("===stateid==${1}");
                    print("===zipcode==${zipCodeInput.text}");

                    if (await _authProvider.SignUpServiceFunction(
                        addressLine1: addressInput.text,
                        addressLine2: 'neasr past area mmkmsdsdfsdfsdf defrg dfrg aertear',
                        birthDate: widget.dob.toString(),
                        cityId: 1,
                        email: widget.email.toString(),
                        firstName: widget.firstName.toString(),
                        genderId: 1,
                        lastName: widget.lastName.toString(),
                        middleName: widget.middleName.toString(),
                        password: widget.password.toString(),
                        phoneNumber: widget.phoneNo.toString(),
                        postalOrZipCode: zipCodeInput.text,
                        provinceOrStateId: 1 )) {
                      NavigatorHelper.add(ProfilePage());
                    }
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
    });
  }
}
