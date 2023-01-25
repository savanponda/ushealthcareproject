import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_banner.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/view/cart/cart_page.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_color.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_description.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_name_detail.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_size.dart';
import 'package:onlinebia/apps/view/product_detail/widget/similar_product.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';

import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, ""),
          showFilterIcon: false,
          showNotificationIcon: false,
          centerTitle: true,
          shownotificationIcon: false,
          showIcon: true,
          showBackIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
          callback: (){
            NavigatorHelper.add(CartPage());
          },
            TotalTitle: false,
            BottomButtonTitle1: 'Add To Cart',
            BottomButtonTitle2: 'Buy Now',
      ),
      body:  Stack(
        children: [
          ProductBanner(),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Scrollbar(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(height: 22,),
                      ProductNameDetail(),
                      WidgetHelper.getFieldSeparator(),
                      ProductSize(),
                      WidgetHelper.getFieldSeparator(),
                      ProductColor(),
                      WidgetHelper.getFieldSeparator(),
                      ProductDescription(),
                      WidgetHelper.getFieldSeparator(),
                      SimilarProduct(),                ],
                  ),
                ),
              );
            },
          ),

        ],
      )
    );
  }
}
