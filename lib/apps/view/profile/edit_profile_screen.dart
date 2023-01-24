import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinebia/apps/view/profile/change_password_screen.dart';
import 'package:onlinebia/custom/TextView.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
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
                    TextView(
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "name"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "email"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "phoneNo"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
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
                    TextView(
                      // arrowicon: true,
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "password"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      // arrowicon: true,
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "address"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      // arrowicon: true,
                      // focusNode: emailNode,
                      // controller: emailIC,
                      label: buildTranslate(context, "payment"),
                      emailValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeEmail: true,
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
