import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/widget/category_details_list.dart';
import 'package:onlinebia/apps/view/home/widget/home_banner.dart';
import 'package:onlinebia/apps/view/home/widget/product_card_list.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'loader/categoryicon_loader.dart';
import 'loader/product_loader.dart';
import 'loader/slider_loader.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool slider = true;
  bool categoryicon = true;
  bool product = true;
  bool indicator = true;

  void initState() {
    super.initState();

    if(slider){
      Timer(Duration(seconds: 2), () {
        setState(() {
          slider = false;
        });
      });
    } if(categoryicon){
      Timer(Duration(seconds: 2), () {
        setState(() {
          categoryicon = false;
        });
      });
    }if(product){
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }if(indicator){
      Timer(Duration(seconds: 2), () {
        setState(() {
          indicator = false;
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
            showcancelIcon:false,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(slider)
                    SliderLoader(),
                  // IndicatorLoader(),
                  if(!slider)...[
                    HomeBanner(),
                  ],
                  if(categoryicon)
                    Container(
                      height: 100,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoryIconLoader(
                          );
                        },
                      ),
                    ),
                  WidgetHelper.getFieldSeparator(), // IndicatorLoader(),
                  if(!categoryicon)...[
                    CategoryDetailsList(),
                  ],
                  WidgetHelper.getFieldSeparator(), // IndicatorLoader(),

                  if(product)
                    ProductLoader(),                   // IndicatorLoader(),
                  if(!product)...[
                    ProductCardList()
                  ],
                ],
              ),
            ),
          ),
        )
    );

  }
}

