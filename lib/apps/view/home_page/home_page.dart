import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/ProductTile.dart';
import 'package:onlinebia/apps/view/home_page/widget/category_details_list.dart';
import 'package:onlinebia/apps/view/home_page/widget/home_banner.dart';
import 'package:onlinebia/apps/view/home_page/widget/product_card_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/Fonts.dart';
import '../../tiles/BannerTile.dart';
import '../../tiles/CategoryIconTIle.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        HomeBanner(),
                        WidgetHelper.getFieldSeparator(),
                        CategoryDetailsList(),
                        WidgetHelper.getFieldSeparator(),
                        ProductCardList()
                      ],
                    ),
              ),
          ),
        )
    );

  }
}

