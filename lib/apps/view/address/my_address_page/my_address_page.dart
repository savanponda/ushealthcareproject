import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/bottom_button_view.dart';
import 'package:onlinebia/apps/view/address/add_address_page/add_address_page.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
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
                  WidgetHelper.getFieldSeparator(),
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
          NavigatorHelper.add(TabBarScreen());
        },),
    );
  }
}
