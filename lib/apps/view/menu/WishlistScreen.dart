import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/product_loader.dart';

import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../tiles/ProductTile.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  bool product = true;

  void initState() {
    super.initState();

    if(product){
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }}
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
                  Center(
                    child: Wrap(
                      spacing: 30,
                      children: [
                        if(product)
                          for(int index=0;index<8;index++)
                            ProductLoader(),
                        if(!product)
                        for(int index=0;index<8;index++)
                          ProductTile(buttonLiked: true,)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
