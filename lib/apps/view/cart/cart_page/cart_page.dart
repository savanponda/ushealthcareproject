import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/cart_page/widget/cart_product_list.dart';

import '../../../../helper/AssetsHelper.dart';
import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../../../common/price_card_tile.dart';
import '../../../common/ProductBottomNavigation.dart';
import '../CheckoutScreen.dart';
import '../checkout_page/checkout_page.dart';
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
                    moveTocart: false,
                  ),
                  WidgetHelper.getFieldSeparator(),
                  PriceCardTile(),
                  WidgetHelper.getFieldSeparator(),
                  WidgetHelper.getFieldSeparator(),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 30,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetsHelper.getIcon("ic_save.png"),
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 10,),
                        Text("Save For Later",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "AppSemiBold",
                            )
                        ),
                      ],
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(),
                  CartProductList(
                    moveTocart: true,
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
