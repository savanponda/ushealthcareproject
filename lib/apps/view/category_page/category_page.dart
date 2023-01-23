import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/category_page/widget/category_details_all_list.dart';

import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import 'loader/category_page_loader.dart';
import '../home_page/loader/categoryicon_loader.dart';

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
        // bottomNavigationBar: TabBarScreen(),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(category)
                    CategoryPageLoader(),                     // IndicatorLoader(),
                  if(!category)...[
                    CategoryDetailsAllList()
                  ],
                ],
              ),
            ),
          ),
        )
    );
  }
}
