import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/category/widget/category_details_all_list.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'loader/category_page_loader.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  bool category = true;

  void initState() {
    super.initState();

    if (category) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          category = false;
        });
      });
    }
  }
  @override  Widget build(BuildContext context) {
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
        // bottomNavigationBar: TabBarPage(),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetHelper.getFieldSeparator(),
                  if(category)
                    CategoryPageLoader(),                     // IndicatorLoader(),
                  if(!category)...[
                    DelayedDisplay(
                        child: CategoryDetailsAllList())
                  ],
                ],
              ),
            ),
          ),
        )
    );
  }
}
