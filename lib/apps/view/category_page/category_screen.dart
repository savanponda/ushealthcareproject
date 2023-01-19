import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/category_page/widget/category_details_all_list.dart';

import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                  CategoryDetailsAllList()
                ],
              ),
            ),
          ),
        )
    );
  }
}
