import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/enum/order_status_main.dart';
import 'package:onlinebia/apps/view/my_order/loader/order_status_loader.dart';
import 'package:onlinebia/apps/view/my_order/widget/order_status_list.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';


class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  bool address = true;
  bool ordercard = true;
  bool pricecard = true;

  TabController? tb;

  void initState() {
    super.initState();

      if(address){
      Timer(Duration(seconds: 2), () {
        setState(() {
          address = false;
        });
      });
    }if(ordercard){
      Timer(Duration(seconds: 2), () {
        setState(() {
          ordercard = false;
        });
      });
    }if(pricecard){
      Timer(Duration(seconds: 2), () {
        setState(() {
          pricecard = false;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black
            ),
            leading: Icon(Icons.arrow_back_outlined,color: Colors.black),
            title: Text(buildTranslate(context, "myOrder"),
              style: TextStyle(
                fontSize: 18,
                fontFamily: "AppSemiBold",
                color: Colors.black,
              ),),
            centerTitle: true,
            bottom:
             TabBar(
               controller: tb,
               labelPadding: EdgeInsets.all(15),
               indicatorColor: AppColor.appColor,
               labelColor: Colors.black,
               unselectedLabelColor: Colors.black,
               isScrollable: true,
               labelStyle: TextStyle(fontSize: 20),
               tabs: [
                Text(buildTranslate(context, "all"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AppSemiBold",
                    color: Colors.black,
                  ),),
                Text(buildTranslate(context, "processing"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AppSemiBold",
                    color: Colors.black,
                  ),),
                Text(buildTranslate(context, "delivered"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AppSemiBold",
                    color: Colors.black,
                  ),),
                Text(buildTranslate(context, "cancelled"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AppSemiBold",
                    color: Colors.black,
                  ),),
              ],
            ),
          ),

        body: TabBarView(
          controller:tb,
          children: [
            if(pricecard)
              OrderStatusLoader(),
            if(!pricecard)
            OrderStatusList(orderStatus:OrderStatusMain.ALL,),
            if(!pricecard)
              OrderStatusList(orderStatus:OrderStatusMain.PROCESSING),
            if(!pricecard)
              OrderStatusList(orderStatus:OrderStatusMain.DELIVERED),
            if(!pricecard)
              OrderStatusList(orderStatus:OrderStatusMain.CANCELLED),
          ],
        )
        )
      );

  }
}
