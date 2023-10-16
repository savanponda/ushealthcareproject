import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/home/loader/product_loader.dart';
import 'package:UShealthcare/apps/view/wishlist/widget/product_card_wishlist.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool product = true;

  void initState() {
    super.initState();

   if(product){
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getSearchHeader(
            context,
            buildTranslate(context, ""),
            shownotificationIcon: true,
            showIcon: true,
            showcancelIcon: false,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  WidgetHelper.getFieldSeparator(),
                  if(product)
                    ProductLoader(),                   // IndicatorLoader(),
                  if(!product)...[
                    DelayedDisplay(
                      child:
                      ProductCardWishList(),)

                  ],
                ],
              ),
            ),
          ),
        )
    );
  }
}
