import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/Model/ProfileData.dart';
import 'package:UShealthcare/apps/common/profile_tile.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  List<ProfileData> lstDetail = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, loadDetail);
  }
  loadDetail(){
    lstDetail.add(ProfileData(title: buildTranslate(context, "privacyPolicy"),select: 1,icon: "ic_pp.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "refundPolicy"),select: 2,icon: "ic_pp.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "orderPolicy"),select: 3,icon: "ic_pp.png",),);
    setState((){ });
  }

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: Column(
            children: [
              for(int index=0;index<lstDetail.length;index++)
                Column(
                  children: [
                    Container(
                        child: ProfileTile(
                          profileDetail: lstDetail[index], callBack: (){}, arrow: true,
                        )
                    ),
                    WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
