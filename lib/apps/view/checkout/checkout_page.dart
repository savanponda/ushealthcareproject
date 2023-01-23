import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/checkout/widget/delivery_address.dart';
import 'package:onlinebia/apps/view/checkout/widget/order_info_list.dart';
import 'package:onlinebia/apps/view/checkout/widget/promo_code_sec.dart';
import 'package:onlinebia/apps/view/payment/my_payment/my_payment_page.dart';

import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../../common/product_bottom_navigation.dart';
import '../../common/price_card_tile.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

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
        BottomButtonTitle1: 'Add To Cart',
        BottomButtonTitle2: 'Checkout',
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

                      DeliveryAddress(),
                      WidgetHelper.getFieldSeparator(
                        height: 20
                      ),
                      OrderInfoList(),
                      WidgetHelper.getFieldSeparator(),
                      PromoCodeSec(),
                      WidgetHelper.getFieldSeparator(),

                    ],
                  ),
                ),
                PriceCardTile(),
                WidgetHelper.getFieldSeparator(),


              ],
            ),
          ),
        ),
      )
    );
  }
}
