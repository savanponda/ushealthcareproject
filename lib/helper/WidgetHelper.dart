import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/notification/notifications_page.dart';
import 'package:onlinebia/apps/view/search/search_bar_page.dart';
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
      height:1,
      width: width ?? 320,
      decoration: BoxDecoration(
        color: AppColor.appDivider,
      ),
    );
  }



  static AppBar getSearchHeader(

      BuildContext context,
      String title, {
        bool showBackIcon=false,
        bool showIcon=false,
        bool shownotificationIcon=false,
        bool showNotificationIcon=true,
        bool showNotificationMenu=false,
        bool showRadius=true,
        bool showSearch=false,
        bool? showcancelIcon,
        bool showElevation=false,
        Function? onRemoveAllClick,
        Function? onReadAllClick,
        Function? onAddressClick,
        Function? onAddIconClick,
        bool centerTitle=true,
        FocusNode? emailNode,

        TextEditingController? searchBar,
      }
      )
  {
    return AppBar(
        title: Row(
          children: [
            Expanded(
              child:showSearch?GestureDetector(
                onTap: (){
                  NavigatorHelper.add(SearchBarPage());
                },
                child: TextFormField(
                  enabled: false,
                  // onChanged: (ValueKey){
                  //
                  // },
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      minWidth: 20,
                    ),
                    fillColor: AppColor.FieldColor,
                    filled: true,
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: new TextStyle(color: AppColor.filterColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor), //.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  // onTap: NavigatorHelper.add(SearchBarPage()),
                ),
              ):TextFormField(
                onChanged: (Value){

                  if(searchBar.toString().isEmpty)[
                    showcancelIcon==true
                  ];
                },
                // focusNode: ,
                focusNode: emailNode,
                controller: searchBar,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    minWidth: 20,
                  ),
                  fillColor: AppColor.FieldColor,
                  filled: true,
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: new TextStyle(color: AppColor.filterColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.FieldColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.FieldColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.FieldColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.FieldColor), //.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  suffixIcon:  Padding(
                    padding:  EdgeInsets.only(left: 15, right: 15),
                    child:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(width: 10,),
                        showcancelIcon==false ?ImageIcon(
                          AssetsHelper.getIcon("ic_seacrh.png"),
                          color: Colors.black,
                          size: 15,
                        ):ImageIcon(
                          AssetsHelper.getIcon("ic_cancel.png"),
                          size: 15,
                        )

                      ],
                    ),
                  ),
                ),
                // onTap: NavigatorHelper.add(SearchBarPage()),
              ),
            ),

          ],
        ),

        titleSpacing: showBackIcon?0:5,
        backgroundColor: Colors.transparent,
        leading: showBackIcon?GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: showBackIcon?Image(image: AssetsHelper.getIcon("ic_back.png"), height: 20, width: 20,):null,
          ),
          onTap: () {
            NavigatorHelper.remove(value: true);
          },
        ):!showBackIcon?Visibility(
          visible: showIcon,
          child: GestureDetector(
            onTap: (){
              NavigatorHelper.add(SearchBarPage());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child:Container(
                child: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetsHelper.getLogo("main_logo.png"),
                      ),
                    ),
                  ),
                  // radius: 70,
                ),
              ),
            ),
          ),
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
            visible: shownotificationIcon,
            child: GestureDetector(
              onTap: (){
                NavigatorHelper.add(ProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                  ),
                  child: Image(
                    image:AssetsHelper.getIcon("ic_notification.png"),
                    height: 26,
                    width: 30,
                    // color: Colors.black,
                    // size: 30,
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

  static AppBar getHeader(
      BuildContext context,
      String title, {
        bool showBackIcon=false,
        bool showIcon=false,
        bool shownotificationIcon=false,
        bool showaddIcon=false,
        bool showFilterIcon=false,
        bool showcancelIcon=false,
        bool showNotificationIcon=true,
        bool showWallet=false,
        bool showMenu=false,
        bool showNotificationMenu=false,
        bool showRadius=true,
        bool showsearch=false,
        bool showElevation=false,
        Function? onRemoveAllClick,
        Function? onReadAllClick,
        Function? onAddressClick,
        Function? onAddIconClick,
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
                      )
                  )
                ],
              ),
            )
        ),

        titleSpacing: showBackIcon?0:5,
        backgroundColor: Colors.transparent,
        leading: showBackIcon?GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: showBackIcon?Image(image: AssetsHelper.getIcon("ic_back.png"), height: 20, width: 20,):null,
          ),
          onTap: () {
            NavigatorHelper.remove(value: true);
          },
        ):!showBackIcon?Visibility(
          visible: showIcon,
          child: GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child:Container(
                child: CircleAvatar(

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetsHelper.getLogo("main_logo.png"),
                      ),
                    ),
                  ),
                  // radius: 70,
                ),
              ),
            ),
          ),
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
            visible: shownotificationIcon,
            child: GestureDetector(
              onTap: (){
                NavigatorHelper.add(NotificationPage());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle

                  ),
                  child: Image(
                    image:AssetsHelper.getIcon("ic_notification.png"),
                    height: 26,
                    width: 30,
                    // color: Colors.black,
                    // size: 30,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: showcancelIcon,
            child: GestureDetector(
              onTap: (){
                // NavigatorHelper.add(NotificationPage());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20,top: 20),
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle

                  ),
                  child: Text(buildTranslate(context, "clear"),style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),)
                ),
              ),
            ),
          ),
          Visibility(
            visible: showaddIcon,
            child: GestureDetector(
              onTap: (){
                if(onAddIconClick!=null)
                  onAddIconClick();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle

                  ),
                  child: ImageIcon(
                    AssetsHelper.getIcon("ic_add.png"),
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          // Visibility(
          //   visible: showFilterIcon,
          //   child: GestureDetector(
          //     onTap: (){
          //       NavigatorHelper.add(ProfilePage());
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.only(right: 20),
          //       child:Container(
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle
          //         ),
          //         child: ImageIcon(
          //           AssetsHelper.getIcon("Vector.png"),
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
        centerTitle: centerTitle,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark,)

    );
  }
}