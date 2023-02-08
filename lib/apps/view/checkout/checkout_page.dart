import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/price_card_tile.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/view/cart/loader/price_card_loader.dart';
import 'package:onlinebia/apps/view/checkout/widget/delivery_address.dart';
import 'package:onlinebia/apps/view/checkout/widget/order_info_list.dart';
import 'package:onlinebia/apps/view/checkout/widget/promo_code_sec.dart';
import 'package:onlinebia/apps/view/payment/my_payment/my_payment_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

import 'loader/delivery_address_loader.dart';
import 'loader/order_info_list_loader.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool address = true;
  bool ordercard = true;
  bool pricecard = true;

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "checkout"),
          showFilterIcon: true,
          showNotificationIcon: false,
          centerTitle: true,
          shownotificationIcon: false,
          showIcon: true,
          showBackIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
          callback: (){
            NavigatorHelper.add(MyPaymentPage());
          },
        TotalTitle: true,
        BottomButtonTitle1: buildTranslate(context, "addToCart"),
        BottomButtonTitle2: buildTranslate(context, "checkout"),
      ),
      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.getFieldSeparator(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(address)
                        DeliveryAddressLoader(),
                      if(!address)...[
                        DeliveryAddress(),
                      ],
                      WidgetHelper.getFieldSeparator(height: 20),

                      if(ordercard)

                        ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrderInfoListLoader(
                              index: index,
                            );
                          },
                        ),
                      if(!ordercard)...[

                        OrderInfoList(),
                      ],
                      PromoCodeSec(),
                      WidgetHelper.getFieldSeparator(),

                    ],
                  ),
                ),
                if(pricecard)
                  PriceCardLoader(),
                if(!pricecard)...[
                  PriceCardTile(),
                ],
                WidgetHelper.getFieldSeparator(),


              ],
            ),
          ),
        ),
      )
    );
  }
}
