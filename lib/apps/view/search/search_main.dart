import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/product_tile.dart';
import 'package:UShealthcare/apps/view/cart/cart_page.dart';
import 'package:UShealthcare/apps/view/home/loader/product_loader.dart';
import 'package:UShealthcare/apps/view/search/widget/filter_bottom_navigation.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {



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
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "fashion"),
          centerTitle: true,
          showBackIcon: true,
          showWallet: true,
          shownotificationIcon: true,
          showsearch: false,
          showSearchIcon: true,
          onCartIconClick: (){
            NavigatorHelper.add(CartPage());
          }
      ),
      bottomNavigationBar: FilterBottom(
        // callback: (){
          // NavigatorHelper.add(AddCartPage());
        // },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: Wrap(
              spacing: 30,
              children: [
                if(product)
                  ProductLoader(),                   // IndicatorLoader(),
                if(!product)...[
                  for(int index=0;index<10;index++)
                    DelayedDisplay(child: ProductTile(likedIcon: false,)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

