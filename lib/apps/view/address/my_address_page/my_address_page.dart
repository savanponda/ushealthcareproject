import 'dart:async';

import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/bottom_button_view.dart';
import 'package:UShealthcare/apps/view/address/add_address_page/add_address_page.dart';
import 'package:UShealthcare/apps/view/my_order/order_successful_page.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'loader/my_address_page_loader.dart';
import 'tile/AddressListTile.dart';
class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  bool myaddress = true;

  void initState() {
    super.initState();

    if(myaddress){
      Timer(Duration(seconds: 2), () {
        setState(() {
          myaddress = false;
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
            buildTranslate(context, "myAddress"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: false,
            showIcon: true,
            showBackIcon: true,
            showaddIcon: true,
            onAddIconClick: (){
              NavigatorHelper.add(AddAddressPage());
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
                  if(myaddress)
                    ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MyAddressPageLoader();
                      },
                    ),

                  if(!myaddress)...[
                    ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AddressListTile(
                          index:index,
                            Callback: (int select){
                              select = 1;
                            }, select: 1);
                      },
                    ),
                  ],

                  WidgetHelper.getFieldSeparator(),

                ],),
            ),
          ),
        ),
      bottomNavigationBar: BottomButtonView(
        ButtonTitle: 'next',
        deSelect: false,
        callback: (){
          NavigatorHelper.add(OrderSuccessfulPage());
        },),
    );
  }
}
