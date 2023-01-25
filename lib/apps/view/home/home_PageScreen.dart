import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/ProductTile.dart';
import 'package:onlinebia/apps/view/auth/login_Screen.dart';
import 'package:onlinebia/apps/view/home/product_loader.dart';
import 'package:onlinebia/apps/view/home/slider_loader.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import '../../tiles/BannerTile.dart';
import '../../tiles/CategoryIconTIle.dart';
import 'categoryicon_loader.dart';
import 'indicator_loader.dart';
class homePageScreen extends StatefulWidget {
  const homePageScreen({Key? key}) : super(key: key);

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  PageController controller = PageController(viewportFraction: 1, keepPage: true, initialPage: 0);
  PageController page = PageController( viewportFraction: 0.9);
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
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "fashion"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: true,
            showIcon: true,
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
                        if(!slider)...[
                          AspectRatio(
                            aspectRatio: 5/2.5,
                            child: PageView.builder(
                              itemCount: 5,
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return BannerTile(
                                );
                              },
                            ),
                          ),
                        ],
                        if(indicator)
                          Container(
                            height: 20,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return IndicatorLoader(
                                );
                              },
                            ),
                          ),

                        if(!indicator)...[
                          SmoothPageIndicator(
                            controller: controller,
                            count: 5, //banner_list.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: AppColor.appTextBorder,
                              dotColor: AppColor.appTextBorder.withOpacity(0.5),
                            ),
                          ),

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
                        if(!categoryicon)...[
                          Container(
                            height: 100,
                            child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CategoryIconTile(
                                  image: 'ic_fashion.png',
                                  title: 'Fashion',
                                  IconHeight: 60,
                                  IconWidth: 60,
                                );
                              },
                            ),
                          ),
                        ],

                        WidgetHelper.getFieldSeparator(),
                        if(product)
                          Center(
                            child: Wrap(
                              spacing: 30,
                              children: [
                                for(int index=0;index<5;index++)
                                  ProductLoader(),
                              ],
                            ),
                          ),

                        if(!product)...[
                          Center(
                            child: Wrap(
                              spacing: 30,
                              children: [
                                for(int index=0;index<5;index++)
                                  ProductTile(buttonLiked: false,)
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
              ),
          ),
        )
    );

  }


  Widget getRow(String label, String label2, int select){
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                label,
                style: Fonts.appBarTextStyle,
              ),
            ),
            GestureDetector(
              onTap: (){
                if (select==1){
                  NavigatorHelper.addWithAnimation(signInScreen());
                }else if (select==2){
                  // NavigatorHelper.add(ReminderPageScreen());
                }else if (select==3){
                  // NavigatorHelper.add(HomeView());
                }
              },
              child: Text(
                label2,
                style: Fonts.viewAllStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

