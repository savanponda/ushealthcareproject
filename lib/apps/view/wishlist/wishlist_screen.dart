import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/loader/product_loader.dart';
import 'package:onlinebia/apps/view/wishlist/widget/product_card_wishlist.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

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
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "fashion"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
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
                    ProductCardWishList()
                  ],
                ],
              ),
            ),
          ),
        )
    );
  }
}
