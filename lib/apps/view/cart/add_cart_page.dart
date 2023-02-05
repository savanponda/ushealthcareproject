import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/widget/cart_product_list.dart';
import 'package:onlinebia/apps/view/checkout/checkout_page.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class AddCartPage extends StatelessWidget {

  AddCartPage({Key? key, }) : super(key: key);
  var random = Random().nextBool();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WidgetHelper.getFieldSeparator(),
                WidgetHelper.getFieldSeparator(),
                Image(
                  height: 92,
                  width: 92,
                  image: AssetsHelper.getIcon("ic_cart.png"),
                ),
                WidgetHelper.getFieldSeparator(),
                Text(
                  buildTranslate(context, "yourCartEmpty"),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                WidgetHelper.getFieldSeparator(),
                WidgetHelper.getFieldSeparator(),
                Container(
                  margin: EdgeInsets.only(left: 100,right: 100),
                  child: ButtonView(
                    color: AppColor.appColor,
                    textColor: AppColor.Buttontext,
                    borderColor:AppColor.appBarText,
                    textSize: 12,
                    radius: 30,
                    iconData: true,
                    onPressed: () {
                      //Scaffold.of(context).hideCurrentSnackBar();
                      NavigatorHelper.add(CheckoutPage());
                    },
                    buttonTextName: buildTranslate(context, "shopNow"),
                  ),
                ),
                WidgetHelper.getFieldSeparator(),
                WidgetHelper.getFieldSeparator(),
                WidgetHelper.getFieldSeparator(),
                WidgetHelper.getFieldSeparator(),
                random?
                CartProductList(
                  moveToCart: true,
                  saveForLater: true,
                ):Container(),
              ],
            ),
          ),
        )
    );
  }
}
