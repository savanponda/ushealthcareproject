import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../apps/view/profile/profile_Screen.dart';
import '../helper/AssetsHelper.dart';
import '../helper/NavigatorHelper.dart';
import '../localization/AppLocalizations.dart';
import '../style/AppColor.dart';

class HeaderbarPage extends StatefulWidget {
  const HeaderbarPage({Key? key}) : super(key: key);

  @override
  State<HeaderbarPage> createState() => _HeaderbarPageState();
}

class _HeaderbarPageState extends State<HeaderbarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:CircleAvatar(
                  backgroundImage: AssetsHelper.getLogo("main_logo.png"),
                  ),
                ),
              ),
               Expanded(
                 child: TextFormField(
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      minWidth: 20,
                    ),
                    fillColor: AppColor.FieldColor,
                    filled: true,
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: new TextStyle(color: Colors.black),
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
                          ImageIcon(
                            AssetsHelper.getIcon("ic_seacrh.png"),
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
               ),

                GestureDetector(
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
                        AssetsHelper.getIcon("ic_notification.png"),
                        size: 30,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}
