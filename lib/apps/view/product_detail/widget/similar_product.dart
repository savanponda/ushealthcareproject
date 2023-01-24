import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/common/product_tile.dart';
import 'package:onlinebia/apps/view/cart/cart_page.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_name_detail.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../../helper/AssetsHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';

class SimilarProduct extends StatefulWidget {
  const SimilarProduct({Key? key}) : super(key: key);

  @override
  State<SimilarProduct> createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Similar Product",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "AppSemiBold",
            color: Colors.black,
          ),
        ),

        WidgetHelper.getFieldSeparator(),
        Center(
          child: Wrap(
            spacing: 30,
            children: [
              for(int index=0;index<5;index++)
                ProductTile(buttonLiked: true,)
            ],
          ),
        ),
        WidgetHelper.getFieldSeparator(),

      ],
    );
  }
}
