import 'package:flutter/material.dart';
import 'package:onlinebia/apps/Model/ProfileData.dart';
import 'package:onlinebia/apps/common/ProfileTile.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

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
    lstDetail.add(ProfileData(title: buildTranslate(context, "privacyPolicy"),select: 1,icon: "ic_pp.png.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "refundPolicy"),select: 2,icon: "ic_pp.png.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "orderPolicy"),select: 3,icon: "ic_pp.png.png", ),);
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              for(int index=0;index<lstDetail.length;index++)
                Column(
                  children: [
                    Container(
                        child: ProfileTile(
                          profileDetail: lstDetail[index],
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
