import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinebia/apps/view/profile/change_password_page.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/InputDecoration.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {

    TextEditingController firstNamedIC = TextEditingController();
    TextEditingController paymentIC = TextEditingController();
    TextEditingController passwordIC = TextEditingController();
    TextEditingController mobileNumberIC = TextEditingController();
    TextEditingController emailIC = TextEditingController();
    TextEditingController addressIC = TextEditingController();
    bool _isObscure = false;
    FocusNode emailNode = FocusNode();
    FocusNode firstNameNode = FocusNode();
    FocusNode passwordNode = FocusNode();
    FocusNode addressNode = FocusNode();
    FocusNode mobileNumberNode = FocusNode();
    FocusNode paymentNode = FocusNode();

    @override
    void dispose() {
      mobileNumberIC.dispose();
      passwordIC.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "myProfile"),
          centerTitle: true,
          showBackIcon: false,
          showNotificationIcon: false,
          onAddressClick: (){
          }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
            GestureDetector(
              onTap: (){
                pickImage(0);
              },
              child: Stack(
                  children:[
                    CircleAvatar(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetsHelper.getImage("ic_profile.png"),
                          ),
                        ),
                      ),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 11,
                      right: 14,
                      child: Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: AppColor.Buttontext.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(7),),
                          image: DecorationImage(
                            scale: 5,
                            image: AssetsHelper.getIcon("ic_edit.png"),
                          ),
                        ),

                      ),
                    )
                  ]
              ),
            ),
            WidgetHelper.getFieldSeparator(),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 24,right: 24),
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: firstNameNode,
                      controller: firstNamedIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "name"),
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.next,
                    ),

                    WidgetHelper.getFieldSeparator(),
                    TextFormField(
                      focusNode: emailNode,
                      controller: emailIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "email"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkEmailValidation(context, value),
                      textInputAction: TextInputAction.next,
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
                    TextButton(
                      child:
                      Text(
                        buildTranslate(context, "save"),
                        style: TextStyle(
                          color: AppColor.appColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.5,
                          fontFamily: "AppBlack"
                        ),
                      ),
                      onPressed: () => {
                        NavigatorHelper.add(ChangePassword())
                      },
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextFormField(
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
                    WidgetHelper.getFieldSeparator(),
                    TextFormField(
                      focusNode: addressNode,
                      controller: addressIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "address"),
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.next,
                    ),

                    WidgetHelper.getFieldSeparator(),
                    TextFormField(
                      focusNode: paymentNode,
                      controller: paymentIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "payment"),
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage(int index) async {
    XFile? xFile;
    if (index == 0) {
      xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }
  }
}
