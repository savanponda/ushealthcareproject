import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/Fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom/ButtonView.dart';
import '../custom/StatusBarView.dart';
import 'AssetsHelper.dart';
import 'NavigatorHelper.dart';

class DialogHelper {
  static showShareDialog(BuildContext context, String title,  Function callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatusBarView(
          child: Scaffold(
              backgroundColor: Colors.black54,
              body: new Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        NavigatorHelper.remove();
                      },
                      child: Container(
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: MediaQuery.of(context).size.width * 0.87,
                            //width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 270,
                                    child: Text(
                                        buildTranslate(context, "editYourCard"),
                                        style: Fonts.appPopUpTextStyle
                                    ),
                                  ),
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 150,
                                        child:  ButtonView(
                                            buttonTextName: buildTranslate(context, "later"),
                                            iconData: false,
                                            textSize: 15,
                                            radius: 30,
                                            color: AppColor.appBgGray,
                                            textColor: AppColor.appColor,
                                            onPressed: (){
                                              NavigatorHelper.remove();
                                            }
                                        ),
                                      ),
                                      Container(
                                        width:150,
                                        child: ButtonView(
                                            buttonTextName: buildTranslate(context, "yes"),
                                            iconData: false,
                                            textSize: 15,
                                            radius: 30,
                                            onPressed: (){
                                              // NavigatorHelper.add(MailPageScreen());
                                            }
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              )
          ),
        );
      },
    );
  }
  // static showShareCardDialog(BuildContext context, String title,  Function callback) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatusBarView(
  //         child: Scaffold(
  //             backgroundColor: Colors.black54,
  //             body: new Builder(
  //                 builder: (BuildContext context) {
  //                   return InkWell(
  //                     onTap: () {
  //                       NavigatorHelper.remove();
  //                     },
  //                     child: Container(
  //                       child: Center(
  //                         child: Container(
  //                           height: MediaQuery.of(context).size.height * 0.27,
  //                           width: MediaQuery.of(context).size.width * 0.87,
  //                           //width: 200,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius: BorderRadius.circular(18),
  //                           ),
  //                           child: Padding(
  //                             padding: const EdgeInsets.symmetric(horizontal: 0),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 Container(
  //                                   width: 200,
  //                                   child: Text(
  //                                       buildTranslate(context, "shareCard"),
  //                                       style: Fonts.appPopUpTextStyle
  //                                   ),
  //                                 ),
  //                                 Container(
  //                                   width: MediaQuery.of(context).size.width,
  //                                   padding: EdgeInsets.only(left: 19,right: 19),
  //                                   height: 50,
  //                                   decoration: BoxDecoration(
  //                                     shape: BoxShape.rectangle,
  //                                     borderRadius: BorderRadius.all(Radius.circular(10)),
  //                                     color: AppColor.FieldColor,
  //                                     boxShadow: [
  //                                       BoxShadow(
  //                                         color: Colors.grey.withOpacity(0.4),
  //                                         spreadRadius: 0.5,
  //                                         offset: Offset(0,0), // changes position of shadow
  //                                       ),
  //
  //                                     ],
  //                                   ),
  //                                   child: Row(
  //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Text(buildTranslate(context, "level2")),
  //                                       Radio(
  //                                         value: 1,
  //                                         groupValue: DetailType,
  //                                         // activeColor: AppColor.Buttoncolor,
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             DetailType = value as int?;
  //                                           });
  //                                         },
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Container(
  //                                   width: MediaQuery.of(context).size.width,
  //                                   padding: EdgeInsets.only(left: 19,right: 19),
  //                                   height: 50,
  //                                   decoration: BoxDecoration(
  //                                     shape: BoxShape.rectangle,
  //                                     borderRadius: BorderRadius.all(Radius.circular(10)),
  //                                     color: AppColor.FieldColor,
  //                                     boxShadow: [
  //                                       BoxShadow(
  //                                         color: Colors.grey.withOpacity(0.4),
  //                                         spreadRadius: 0.5,
  //                                         offset: Offset(0,0), // changes position of shadow
  //                                       ),
  //
  //                                     ],
  //                                   ),
  //                                   child: Row(
  //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Text(buildTranslate(context, "level2")),
  //                                       Radio(
  //                                         value: 2,
  //                                         groupValue: DetailType,
  //                                         // activeColor: AppColor.Buttoncolor,
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             DetailType = value as int?;
  //                                           });
  //                                         },
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(height: 25,),
  //                                 Row(
  //                                   children: [
  //                                     Container(
  //                                       width: 150,
  //                                       child:  ButtonView(
  //                                           buttonTextName: buildTranslate(context, "later"),
  //                                           iconData: false,
  //                                           textSize: 15,
  //                                           radius: 30,
  //                                           color: AppColor.appBgGray,
  //                                           textColor: AppColor.appColor,
  //                                           onPressed: (){}
  //                                       ),
  //                                     ),
  //                                     Container(
  //                                       width:150,
  //                                       child: ButtonView(
  //                                           buttonTextName: buildTranslate(context, "yes"),
  //                                           iconData: false,
  //                                           textSize: 15,
  //                                           radius: 30,
  //                                           onPressed: (){
  //                                             NavigatorHelper.add(MailPageScreen());
  //                                           }
  //                                       ),
  //                                     )
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 }
  //             )
  //         ),
  //       );
  //     },
  //   );
  // }
  static showConfirmDialog(BuildContext context, String title,  Function callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatusBarView(
          isLight: true,
          child: Scaffold(
              backgroundColor: Colors.black54,
              body: new Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        NavigatorHelper.remove();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.42,
                            //width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.all(25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  //spacing: MediaQuery.of(context).size.width*0.075,
                                  child:
                                  Image(
                                    image: AssetsHelper.getIcon("ic_done.png"),
                                    height: 160,
                                    width: 160,
                                  ),),
                                SizedBox(height: 20,),
                                Text(
                                  buildTranslate(context, "sendSuccessfully"),
                                  style:TextStyle(
                                    fontSize: 25,
                                    color: AppColor.appColor,
                                    fontFamily: "AppSemiBold",
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              )
          ),
        );
      },
    );
  }
}
