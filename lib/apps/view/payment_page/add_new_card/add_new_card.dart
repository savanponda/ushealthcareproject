import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/payment_page/my_payment/my_payment_page.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "myPayment"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: false,
            showIcon: true,
            showBackIcon: true,
            showaddIcon: true,
            onAddIconClick: (){
              NavigatorHelper.add(MyPaymentPage());
            },
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
                    buttonTextName: buildTranslate(context, "continue"),
                  ),


                ],),
            ),
          ),
        )
    );
  }
}
