
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinebia/apps/Model/ProfileData.dart';
import 'package:onlinebia/apps/common/profile_tile.dart';
import 'package:onlinebia/apps/view/notification/notifications_page.dart';
import 'package:onlinebia/apps/view/order/my_order_page.dart';
import 'package:onlinebia/apps/view/order_summary/order_details.dart';
import 'package:onlinebia/apps/view/profile/edit_profile_page.dart';
import 'package:onlinebia/apps/view/profile/privacy_policy_page.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key,}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileData> lstDetail = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, loadDetail);
  }
  loadDetail(){
    lstDetail.add(ProfileData(title: buildTranslate(context, "language"),select: 1,icon: "ic_language.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "customerSupport"),select: 2,icon: "ic_question.png"),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "aboutUs"),select: 3,icon: "ic_about_us.png", ),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "orderHistory"),select: 4,icon: "ic_orderhistory_icon.png",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "notifications"),select: 5,icon: "ic_notification_icon.png",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "privacyPolicy"),select: 6,icon: "ic_pp.png", ),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "termsCondition"),select: 7,icon: "ic_terms_condition.png",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "rateUs"),select: 8,icon: "ic_rate_us_icon.png",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "shareUs"),select: 9,icon: "ic_share_lined.png",),);
    lstDetail.add(ProfileData(title: buildTranslate(context, "logOut"),select: 10,icon: "ic_logout_icon.png",),);

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
            children: [
              Row(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("John Diesel",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "AppSemiBold",
                          color: Colors.black,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5,),
                      Text("@John199",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "AppRegular",
                          color: Colors.black,
                        ),
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      NavigatorHelper.add(EditProfile());
                    },
                    child:
                    Container(
                        height: 25,
                        width: 25,
                        child: Image(
                          image: AssetsHelper.getIcon("ic_edit.png"),
                        )),
                  )
                ],
              ),
              SizedBox(height: 20,),
              for(int index=0;index<lstDetail.length;index++)
                Column(
                  children: [
                    Container(
                        child: ProfileTile(
                          callBack: (){
                            if(lstDetail[index].select==1){
                              // NavigatorHelper.add(PrivacyPolicy());
                            }if(lstDetail[index].select==2){
                              // NavigatorHelper.add(OrderDetails());
                            }if(lstDetail[index].select==3){
                              // NavigatorHelper.add(OrderSummaryModal());
                            }if(lstDetail[index].select==4){
                              NavigatorHelper.add(OrderDetails());
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
                    lstDetail[index].select!=10?WidgetHelper.getDivider(width:MediaQuery.of(context).size.width):Container(),
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