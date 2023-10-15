import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlinebia/apps/view/complate_profile_details/contect_Details.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/custom/StepperView.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
import 'package:onlinebia/utils/Utils.dart';

class personalDetails extends StatefulWidget {
  const personalDetails({Key? key}) : super(key: key);

  @override
  State<personalDetails> createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {

  TextEditingController dateinput = TextEditingController();

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
                child: StepperView(progress: 1, count: 3,
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
                    'First Name',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    style: Fonts.fieldStyle,
                    decoration:  InputDecoration(
                      hintText: buildTranslate(context, "firstname"),
                      fillColor: AppColor.FieldColor,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) => ValidationHelper.checkBlankValidation(context, value!, "name"),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Middle Name',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),

                  TextFormField(
                    style: Fonts.fieldStyle,
                    decoration:  InputDecoration(
                      hintText: buildTranslate(context, "misname"),
                      fillColor: AppColor.FieldColor,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) => ValidationHelper.checkBlankValidation(context, value!, "name"),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Last Name',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    style: Fonts.fieldStyle,
                    decoration:  InputDecoration(
                      hintText: buildTranslate(context, "lastname"),
                      fillColor: AppColor.FieldColor,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) => ValidationHelper.checkBlankValidation(context, value!, "name"),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  Text(
                    'Please enter date of birth',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F3437),
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text = formattedDate; //set output date to TextField value.
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },

                    controller: dateinput,
                    style: Fonts.fieldStyle,
                    decoration:  InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      hintText: buildTranslate(context, "MM-DD-YYY"),
                      fillColor: AppColor.FieldColor,
                      // filled: true,

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appDivider), //.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // textInputAction: TextInputAction.next,

                    // validator: (value) => ValidationHelper.checkBlankValidation(context, value!, "name"),
                  ),
                  WidgetHelper.getFieldSeparator(),
                ],
              ),
            ),

            Container(
              margin:  EdgeInsets.fromLTRB(15,10.0, 15, 10.0),
              child: ButtonView(
                color: AppColor.appColor,
                textColor: AppColor.appColorWhite,
                // borderColor:AppColor.appBar,
                textSize: 14,
                radius: 30,
                iconData: false,
                onPressed: () {
                  //Scaffold.of(context).hideCurrentSnackBar();
                  NavigatorHelper.add(contectDetails());
                },
                buttonTextName: buildTranslate(context, "next"),
              ),
            ),
            WidgetHelper.getFieldSeparator(),
            WidgetHelper.getFieldSeparator(),
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
                      buildTranslate(context, "alreadyHaveAccount"),
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
                        NavigatorHelper.add(personalDetails());
                      },
                      child: Text(
                        buildTranslate(context, "signIn"),
                        style: Fonts.appBottomTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
