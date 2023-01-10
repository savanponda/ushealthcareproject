
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helper/AssetsHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key,}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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

              GestureDetector(
                onTap: (){
                  pickImage(0);
                },
                child: Stack(
                    children:[
                      CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetsHelper.getLogo("shin-min-jeong.jpg"),
                            ),
                          ),
                        ),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            color: AppColor.appColor,
                            borderRadius: BorderRadius.all(Radius.circular(7),),
                            image: DecorationImage(
                              scale: 5,
                              image: AssetsHelper.getIcon("Edit-Profile-2.png"),
                            ),
                          ),

                        ),
                      )
                    ]),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 10),
                  child: Column(
                    children: [
                      Text("Andrew Ainsley",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "AppRegular",
                        ),
                      ),
                      SizedBox(
                        height:3,
                      ),
                      Text("andrew789@gmail.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "AppRegular",
                        ),
                      )
                    ],
                  )
              ),
              WidgetHelper.getFieldSeparator(),
              getRow("Edit-Profile.png",buildTranslate(context, "editProfile"), 1),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("Notifications.png",buildTranslate(context, "notifications"), 2),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("Security.png",buildTranslate(context, "security"), 3),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("Privacy-Policy.png",buildTranslate(context, "privacyPolicy"), 4),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),

              getRow("Help-and-Support.png",buildTranslate(context, "help&Support"), 5),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("Contact-Us.png",buildTranslate(context, "contactUS"), 6),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("Logout.png",buildTranslate(context, "logOut"), 7),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
            ],
          ),
        ),
      ),
    );
  }
  Widget getRow(String iconName, String label, int select){
    return Padding(
      padding:  EdgeInsets.only(bottom: 10,),
      child: GestureDetector(
        onTap: (){
          if (select==1){
            // NavigatorHelper.add(DialogHelper.showConfirmDialog(context,  buildTranslate(context, "editYourCard"), () {
            // }),);
          }else if (select==2){
            // NavigatorHelper.add(SaveDetailsScreen());
          }else if (select==3){
            // NavigatorHelper.add(DetailsScreen());
          }else if (select==4){
            // NavigatorHelper.add(EditDetailsScreen());
          }else if (select==5){
            // NavigatorHelper.add(PaymentMethodScreen());
          }else if (select==6){
            // NavigatorHelper.add(HomeView());
          }else if (select==7){
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
                    decoration: BoxDecoration(
                        color: AppColor.appBgGray,
                        shape: BoxShape.circle
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColor.appBgGray,
                      radius: 20,
                      child:ImageIcon(
                        AssetsHelper.getIcon(iconName),
                        color: AppColor.appTitle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    label,
                    style: Fonts.profileManuStyle,
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
  Future pickImage(int index) async {
    XFile? xFile;
    if (index == 0) {
      xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }
  }

}