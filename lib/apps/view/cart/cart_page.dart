import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/common/price_card_tile.dart';
import 'package:onlinebia/apps/view/cart/add_cart_page.dart';
import 'package:onlinebia/apps/view/cart/widget/cart_product_list.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';


import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'loader/cart_product_list_loader.dart';
import 'loader/header_loader.dart';
import 'loader/price_card_loader.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool product = true;
  bool price = true;
  bool header = true;

  void initState() {
    super.initState();
    if(product){
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }
    if(price){
      Timer(Duration(seconds: 2), () {
        setState(() {
          price = false;
        });
      });
    }if(header){
      Timer(Duration(seconds: 2), () {
        setState(() {
          header = false;
        });
      });
    }}
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
            NavigatorHelper.add(AddCartPage());
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

                  if(product)
                    for(int index=0;index<2;index++)
                    CartProductListLoader(),
                  if(!product)...[
                    CartProductList(
                      moveToCart: false,
                      saveForLater: false,
                    ),
                  ],
                  WidgetHelper.getFieldSeparator(),

                  if(price)
                    PriceCardLoader(),
                  if(!price)...[
                    PriceCardTile(),
                  ],

                  WidgetHelper.getFieldSeparator(),
                  WidgetHelper.getFieldSeparator(),
                   if(header)
                     HeaderLoader(),
                     if(price)
                       for(int index=0;index<2;index++)
                       CartProductListLoader(),
                    if(!price)...[
                    CartProductList(
                      moveToCart: true,
                      saveForLater: true,
                    ),
                  ]
                ],
              ),
            ),
          ),
        )
    );
  }
}
