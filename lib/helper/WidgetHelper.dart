import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../apps/view/profile/profile_Screen.dart';
import '../localization/AppLocalizations.dart';
import '../style/AppColor.dart';
import '../style/Fonts.dart';
import 'AssetsHelper.dart';
import 'DialogHelper.dart';
import 'NavigatorHelper.dart';

class WidgetHelper {

  static Widget getFieldSeparator({double? height}) {
    return SizedBox(
      height: height??15,
    );
  }

  static Widget getIndicator(String str,Color color){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 5,),
        Container(
          height: 10,
          width: 10,
          color:color,
        ),
        SizedBox(width: 5,),
        Text(str),
      ],
    );
  }

  static Widget getDivider({double? width}) {
    return Container(
      height: 0.3,
      width: width ?? 320,
      decoration: BoxDecoration(
        color: AppColor.appDivider,
      ),
    );
  }

  static AppBar   getHeader(
      BuildContext context,
      String title, {
        bool showBackIcon=false,
        bool showAddIcon=false,
        bool showFilterIcon=false,
        bool showNotificationIcon=true,
        bool showWallet=false,
        bool showMenu=false,
        bool showNotificationMenu=false,
        bool showRadius=true,
        bool showElevation=false,
        Function? onRemoveAllClick,
        Function? onReadAllClick,
        Function? onAddressClick,
        bool centerTitle=true,
      }
      )
  {

    return AppBar(
        title: FittedBox(
            child: InkWell(
              onTap: (){
                if(onAddressClick!=null)
                  onAddressClick();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 1.0,),
                    child: !showBackIcon?Text(
                      title,
                      style: Fonts.appBarTextStyle,
                    ):Text(

                      title,
                      style: Fonts.appBarTextStyle,
                    ),
                  ),
                ],
              ),
            )
        ),

        titleSpacing: showBackIcon?0:5,
        backgroundColor: Colors.transparent,
        leading: showBackIcon?GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: showBackIcon?Image(image: AssetsHelper.getIcon("Back.png"), height: 20, width: 20,):null,
          ),
          onTap: () {
            NavigatorHelper.remove(value: true);
          },
        ):null,
        //leading: null,
        automaticallyImplyLeading: false,
        elevation: showElevation?2:0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(showRadius?25:0),
          ),
        ),
        actions: [

          Visibility(
            visible: showAddIcon,
            child: GestureDetector(
              onTap: (){
                NavigatorHelper.add(ProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle

                ),
                  child: ImageIcon(
                    AssetsHelper.getIcon("Add.png"),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: showFilterIcon,
            child: GestureDetector(
              onTap: (){
                NavigatorHelper.add(ProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: ImageIcon(
                    AssetsHelper.getIcon("Vector.png"),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: centerTitle,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark,)

    );
  }
}