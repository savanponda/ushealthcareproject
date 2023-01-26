import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/Model/ProfileData.dart';
import 'package:onlinebia/apps/view/profile/edit_profile_screen.dart';
import 'package:onlinebia/apps/view/profile/privacy_Policy_Screen.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import '../../helper/AssetsHelper.dart';
import '../../localization/AppLocalizations.dart';
import '../../style/AppColor.dart';
import '../../style/Fonts.dart';

class ProfileTile extends StatelessWidget{
  final ProfileData profileDetail;
  final Function callBack;
  bool arrow;

  ProfileTile({Key? key, required this.profileDetail,required this.callBack, required this.arrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        margin:  EdgeInsets.only(bottom: 14,top: 14,right: 8),
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
            arrow==true?Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black87,):Container(),
          ],
        ),

      ),
    );
  }
}

