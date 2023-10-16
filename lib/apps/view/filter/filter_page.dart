import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/product_bottom_navigation.dart';
import 'package:UShealthcare/apps/view/filter/widget/filter_category_page.dart';
import 'package:UShealthcare/apps/view/filter/widget/filter_discount_page.dart';
import 'package:UShealthcare/apps/view/filter/widget/filter_price_page.dart';
import 'package:UShealthcare/apps/view/filter/widget/filter_rating_page.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/Fonts.dart';


class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int currentIndex = 1;
  final PageController _pageController = PageController();
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool name = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "filters"),
          showBackIcon: true,
          centerTitle: true,
          showcancelIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
        callback: (){
          // NavigatorHelper.add(AddCartPage());
        },
        TotalTitle: false,
        BottomButtonTitle1: 'Product Found',
        BottomButtonTitle2: 'Apply Filter',
      ),
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height,
                  color: AppColor.filterColor,
                  child: SafeArea(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          InkWell(
                            onTap:(){
                              onTap(1);
                              },
                            child: Text(buildTranslate(context,"price2"),
                              style:Fonts.filtertext.copyWith(color: currentIndex==1?AppColor.appColor:null),
                            ),
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          InkWell(
                            onTap:(){ onTap(2);},
                            child: Text(buildTranslate(context,"category"),
                              style:Fonts.filtertext.copyWith(color: currentIndex==2?AppColor.appColor:null),
                            ),
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          InkWell(
                            onTap:(){ onTap(3);},

                            child: Text(buildTranslate(context,"customerRatings"),
                              style:Fonts.filtertext.copyWith(color: currentIndex==3?AppColor.appColor:null),
                            ),
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          GestureDetector(
                            child: Text(buildTranslate(context,"discount"),
                              style:Fonts.filtertext.copyWith(color: currentIndex==4?AppColor.appColor:null),
                            ),
                            onTap:(){ onTap(4);},
                          ),
                          WidgetHelper.getFieldSeparator(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: PageView(
                              controller: _pageController,
                              children: [
                                currentIndex==1?FilterPricePage():
                                currentIndex==2?FilterCategoryPage():
                                currentIndex==3?FilterRatingPage():
                                currentIndex==4?FilterDiscountPage():Container()
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
