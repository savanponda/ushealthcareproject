import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/cart_page/widget/cart_product_list.dart';

import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../../../common/price_card_tile.dart';
import '../../../common/ProductBottomNavigation.dart';
import '../../checkout_page/checkout_page.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "cart"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        bottomNavigationBar: ProductBottomNavigation(
          callback: (){
            NavigatorHelper.add(CheckoutPage());
          },
          TotalTitle: true,
          BottomButtonTitle1: 'Add To Cart',
          BottomButtonTitle2: 'Place Order',
        ),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CartProductList(
                    moveToCart: false,
                    saveForLater: false,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  PriceCardTile(),
                  WidgetHelper.getFieldSeparator(),
                  WidgetHelper.getFieldSeparator(),
                  CartProductList(
                    moveToCart: true,
                    saveForLater: true,
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
