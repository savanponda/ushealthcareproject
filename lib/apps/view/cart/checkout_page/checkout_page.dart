import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/PaymentScreen.dart';
import 'package:onlinebia/apps/view/cart/checkout_page/widget/delivery_address.dart';
import 'package:onlinebia/apps/view/cart/checkout_page/widget/order_info_list.dart';

import '../../../../custom/TextView.dart';
import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../../../common/ProductBottomNavigation.dart';
import '../../../common/price_card_tile.dart';
import '../../../tiles/PromoCodeTile.dart';
import '../PromoCodeScreen.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  TextEditingController promoCodeIC = TextEditingController();
  FocusNode promoCodeNode = FocusNode();

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
          shownotificationIcon: true,
          showIcon: true,
          showBackIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
          callback: (){
            NavigatorHelper.add(PaymentScreen());
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
                      GestureDetector(
                        onTap: (){
                          NavigatorHelper.add(PromoCodeScreen());
                        },
                        child: Text("Promo Code",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "AppSemiBold",
                            )
                        ),
                      ),
                      WidgetHelper.getFieldSeparator(),
                      TextView(
                        focusNode: promoCodeNode,
                        controller: promoCodeIC,
                        passwordIcon: false,
                        applyIcon: true,
                        // assetIcon:'Phone-Icon.png',
                        label: buildTranslate(context, "promoCode"),
                        //phoneIcon: true,
                        obscureText: false,
                        emailValidator: false,
                        textInputAction: true,
                        textCapitalization: true,
                        keyboardTypeEmail: true,
                        inputFormatters: true,
                      ),
                      WidgetHelper.getFieldSeparator(),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return PromoCodeTile();
                          },
                        ),
                      ),

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
