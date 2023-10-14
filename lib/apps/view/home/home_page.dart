import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinebia/apps/common/internet_bloc/internet_bloc.dart';
import 'package:onlinebia/apps/view/home/widget/category_details_list.dart';
import 'package:onlinebia/apps/view/home/widget/home_banner.dart';
import 'package:onlinebia/apps/view/home/widget/product_card_list.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
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

    if (slider) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          slider = false;
        });
      });
    }
    if (categoryicon) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          categoryicon = false;
        });
      });
    }
    if (product) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }
    if (indicator) {
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
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "myProfile"),
            centerTitle: true,
            showBackIcon: false,
            showNotificationIcon: false,
            onAddressClick: (){
            }
        ),
        // appBar: WidgetHelper.getSearchHeader(
        //     context,
        //     buildTranslate(context, ""),
        //     shownotificationIcon: true,
        //     showIcon: true,
        //     showSearch: true,
        //     showcancelIcon: false,
        //     onAddressClick: () {
        //       // NavigatorHelper.remove();
        //     }
        // ),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocConsumer<InternetBloc, InternetState>(
                listener: (context, state) {
                  if(state is InternetLostState){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Internet connection is lost !!!",
                           style: TextStyle(
                          ),
                          ),
                        backgroundColor: AppColor.appColor,
                      )
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      if(slider)
                        SliderLoader(),
                      // IndicatorLoader(),
                      if(!slider)...[
                        DelayedDisplay
                          (
                            child: HomeBanner()),
                      ],
                      if(categoryicon)
                        Container(
                          height: 80,
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
                        DelayedDisplay(child: CategoryDetailsList()),
                      ],
                      WidgetHelper.getFieldSeparator(), // IndicatorLoader(),

                      if(product)
                        ProductLoader(), // IndicatorLoader(),
                      if(!product)...[
                        DelayedDisplay(
                            child: ProductCardList())
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}

