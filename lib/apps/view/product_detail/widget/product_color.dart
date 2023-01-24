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

class ProductColor extends StatefulWidget {
  const ProductColor({Key? key}) : super(key: key);

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Color",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10,),
            WidgetHelper.getFieldSeparator(),

          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:AppColor.appDivider, width: 2),
              ),
            ),
          ],
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    );
  }
}
