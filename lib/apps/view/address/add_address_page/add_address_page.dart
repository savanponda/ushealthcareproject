import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "myAddress"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: true,
            showIcon: true,
            showBackIcon: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),

        body:  Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [


                  ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 16,
                    radius: 30,
                    iconData: false,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.remove();
                    },
                    buttonTextName: buildTranslate(context, "next"),
                  ),


                ],),
            ),
          ),
        )
    );
  }
}
