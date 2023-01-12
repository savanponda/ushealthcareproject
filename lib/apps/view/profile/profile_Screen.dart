
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
          buildTranslate(context, "fashion"),
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
                  // SizedBox(width: 120),
                  Spacer(),
                  Container(
                      height: 25,
                      width: 25,
                      child: Image(
                        image: AssetsHelper.getIcon("ic_edit.png"),
                      )),
                ],
              ),

              WidgetHelper.getFieldSeparator(),
              getRow("ic_language.png",buildTranslate(context, "language"), 1),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_question.png",buildTranslate(context, "customerSupport"), 2),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_about_us.png",buildTranslate(context, "aboutUs"), 3),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_bag_out.png",buildTranslate(context, "contactUs"), 4),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_faqs.png",buildTranslate(context, "faqs"), 5),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_pp.png",buildTranslate(context, "privacyPolicy"), 6),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_terms_condition.png",buildTranslate(context, "termsCondition"), 7),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_shiping_policy.png",buildTranslate(context, "shippingPolicy"), 8),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_return_policy.png",buildTranslate(context, "returnPolicy"), 9),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_rate_us.png",buildTranslate(context, "rateUs"), 10),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
              getRow("ic_rate_us.png",buildTranslate(context, "shareUs"), 11),
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
                    child:ImageIcon(
                      AssetsHelper.getIcon(iconName),
                      color: AppColor.appColor,
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