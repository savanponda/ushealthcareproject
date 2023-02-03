import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';
import 'package:onlinebia/apps/view/home/loader/product_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getSearchHeader(
          context,
          buildTranslate(context, ""),
          shownotificationIcon: true,
          showBackIcon: true,
          showcancelIcon:false,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Wrap(
              spacing: 30,
              children: [
                if(product)
                  ProductLoader(),                   // IndicatorLoader(),
                if(!product)...[
                  for(int index=0;index<10;index++)
                    ProductTile(likedIcon: false,),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
