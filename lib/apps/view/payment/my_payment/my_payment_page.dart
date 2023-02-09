import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/bottom_button_view.dart';
import 'package:onlinebia/apps/view/address/my_address_page/my_address_page.dart';
import 'package:onlinebia/apps/view/payment/add_new_card/add_new_card.dart';
import 'package:onlinebia/apps/view/payment/my_payment/widget/my_card_list.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

import 'loader/my_payment_page_loader.dart';

class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({Key? key}) : super(key: key);

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {

  TextEditingController promoCodeIC = TextEditingController();
  FocusNode promoCodeNode = FocusNode();
  bool mypayment = true;


  void initState() {
    super.initState();

    if(mypayment){
      Timer(Duration(seconds: 2), () {
        setState(() {
          mypayment = false;
        });
      });
    }
  }
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
            NavigatorHelper.add(AddNewCardPage());
          },
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(mypayment)
                  ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  MyPaymentPageLoader();
                  },
                ),
              if(!mypayment)...[
                MyCardList(),
              ],
            ],),
        ),
      ),
      bottomNavigationBar:
      BottomButtonView(
        ButtonTitle: 'makePayment',
        deSelect: false,

        callback: (){
        NavigatorHelper.add(MyAddressPage());
      },),
          );
  }
}
