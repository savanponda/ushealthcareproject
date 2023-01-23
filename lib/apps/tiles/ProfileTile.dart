import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/Model/ProfileData.dart';
import 'package:onlinebia/apps/view/profile/privacy_Policy_Screen.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import '../../helper/AssetsHelper.dart';
import '../../localization/AppLocalizations.dart';
import '../../style/AppColor.dart';
import '../../style/Fonts.dart';

class ProfileTile extends StatelessWidget{
  final ProfileData profileDetail;

  ProfileTile({Key? key, required this.profileDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10,),
      child: GestureDetector(
        onTap: (){
          if (profileDetail==1){
            // NavigatorHelper.add(DialogHelper.showConfirmDialog(context,  buildTranslate(context, "editYourCard"), () {
            // }),);
          }else if (profileDetail==2){
            // NavigatorHelper.add(SaveDetailsScreen());
          }else if (profileDetail==3){
            // NavigatorHelper.add(DetailsScreen());
          }else if (profileDetail==4){
            // NavigatorHelper.add(EditDetailsScreen());
          }else if (profileDetail==5){
            // NavigatorHelper.add(PaymentMethodScreen());
          }else if (profileDetail==6){
            NavigatorHelper.add(PrivacyPolicy());
          }else if (profileDetail==7){
            // NavigatorHelper.add(ChangePassword());
          }
        },
        child: Container(
          margin:  EdgeInsets.only(top: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child:ImageIcon(
                      AssetsHelper.getIcon(profileDetail.icon),
                      color: AppColor.appColor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    profileDetail.title,
                    style: Fonts.profileMenuStyle,
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black87,)
            ],
          ),

        ),
      ),
    );
  }
}

