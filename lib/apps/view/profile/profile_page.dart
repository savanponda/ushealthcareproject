
import 'package:animate_do/animate_do.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:UShealthcare/apps/Model/ProfileData.dart';
import 'package:UShealthcare/apps/common/profile_tile.dart';
import 'package:UShealthcare/apps/view/my_order/my_order_page.dart';
import 'package:UShealthcare/apps/view/notification/notifications_page.dart';
import 'package:UShealthcare/apps/view/profile/edit_profile_page.dart';
import 'package:UShealthcare/apps/view/profile/privacy_policy_page.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key,}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileData> lstDetail = [];
  List<ProfileData> lstDetail1 = [];
  List<ProfileData> lstDetail2 = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, loadDetail);
    Future.delayed(Duration.zero, loadDetail1);
    Future.delayed(Duration.zero, loadDetail2);
  }
  loadDetail(){
    lstDetail.add(ProfileData(title: buildTranslate(context, "profile"),select: 1,icon: ""),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "wallet"),select: 2,icon: ""),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "availability"),select: 3,icon: "", ),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "notifications"),select: 4,icon: "",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "changePassword"),select: 5,icon: "",),);

    setState((){ });
  }
  loadDetail1(){
    lstDetail1.add(ProfileData(title: buildTranslate(context, "privacyPolicy"),select: 1,icon: ""),);
    lstDetail1.add(ProfileData(title: buildTranslate(context, "endUserAgreement"),select: 2,icon: ""),);
    lstDetail1.add(ProfileData(title: buildTranslate(context, "getHelp"),select: 3,icon: "", ),);
    setState((){ });
  }
  loadDetail2(){
    lstDetail2.add(ProfileData(title: buildTranslate(context, "deleteAccount"),select: 1,icon: ""),);
    lstDetail2.add(ProfileData(title: buildTranslate(context, "logout"),select: 2,icon: ""),);
    setState((){ });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "myProfile"),
          centerTitle: true,
          showBackIcon: true,
          showNotificationIcon: false,
          onAddressClick: (){
          }
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        image: DecorationImage(
                          scale: 2.5,
                          image: AssetsHelper.getImage("ic_vector.png"),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10,),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //
                    //     Text("John Diesel",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         fontFamily: "AppSemiBold",
                    //         color: Colors.black,
                    //       ),
                    //
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //     SizedBox(height: 5,),
                    //     Text("@John199",
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         fontFamily: "AppRegular",
                    //         color: Colors.black,
                    //       ),
                    //       //overflow: TextOverflow.ellipsis,
                    //     ),
                    //   ],
                    // ),
                    // Spacer(),
                    // GestureDetector(
                    //   onTap: (){
                    //     NavigatorHelper.add(EditProfile());
                    //   },
                    //   child:
                    //   Container(
                    //       height: 25,
                    //       width: 25,
                    //       child: Image(
                    //         image: AssetsHelper.getIcon("ic_edit.png"),
                    //       )),
                    // )
                    SizedBox(height: 10,),
                    Text("Grace James",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),

                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20,),
                    WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),

                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20,),
              for(int index=0;index<lstDetail.length;index++)
                Column(
                  children: [
                    Column(
                      children: [

                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            color: AppColor.profileBackground,
                              child: ProfileTile(
                                callBack: (){
                                  if(lstDetail[index].select==1){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail[index].select==2){
                                    // NavigatorHelper.add(OrderDetails());
                                  }if(lstDetail[index].select==3){
                                    // NavigatorHelper.add(OrderSummaryModal());
                                  }if(lstDetail[index].select==4){
                                    NavigatorHelper.add(MyOrderPage());
                                  }if(lstDetail[index].select==5){
                                    NavigatorHelper.add(NotificationPage());
                                  }if(lstDetail[index].select==6){
                                    NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail[index].select==7){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail[index].select==8){
                                    // NavigatorHelper.add(OrderDetails());
                                  }if(lstDetail[index].select==9){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail[index].select==10){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }
                                },
                                profileDetail: lstDetail[index],
                                arrow: lstDetail[index].select==10?false:true,
                              )
                          ),
                        ),
                        lstDetail[index].select!=10?FadeInUp(
                            delay:  Duration(milliseconds: 300),
                            child:Container()):Container(),
                      ],
                    ),
                  ],
                ),


              SizedBox(height: 20,),
              Text("Help and support",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),

                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20,),
              for(int index=0;index<lstDetail1.length;index++)
                Column(
                  children: [
                    Column(
                      children: [

                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              color: AppColor.profileBackground,
                              child: ProfileTile(
                                callBack: (){
                                  if(lstDetail1[index].select==1){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail1[index].select==2){
                                    // NavigatorHelper.add(OrderDetails());
                                  }if(lstDetail1[index].select==3){
                                    // NavigatorHelper.add(OrderSummaryModal());
                                  }
                                },
                                profileDetail: lstDetail1[index],
                                arrow: lstDetail1[index].select==10?false:true,
                              )
                          ),
                        ),
                        lstDetail1[index].select!=10?FadeInUp(
                            delay:  Duration(milliseconds: 300),
                            child:Container()):Container(),
                      ],
                    ),
                  ],
                ),


              SizedBox(height: 20,),
              Text("Account",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),

                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20,),
              for(int index=0;index<lstDetail2.length;index++)
                Column(
                  children: [
                    Column(
                      children: [

                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              color: AppColor.profileBackground,
                              child: ProfileTile(
                                callBack: (){
                                  if(lstDetail2[index].select==1){
                                    // NavigatorHelper.add(PrivacyPolicy());
                                  }if(lstDetail2[index].select==2){
                                    // NavigatorHelper.add(OrderDetails());
                                  }if(lstDetail2[index].select==3){
                                    // NavigatorHelper.add(OrderSummaryModal());
                                  }
                                },
                                profileDetail: lstDetail2[index],
                                arrow: lstDetail2[index].select==10?false:true,
                              )
                          ),
                        ),
                        lstDetail2[index].select!=10?FadeInUp(
                            delay:  Duration(milliseconds: 300),
                            child:Container()):Container(),
                      ],
                    ),
                  ],
                ),

            ],
          ),
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