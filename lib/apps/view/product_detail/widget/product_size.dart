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

class ProductSize extends StatefulWidget {
  const ProductSize({Key? key}) : super(key: key);

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Size",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text("Size",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "AppSemiBold",
                color: AppColor.appColor,
              ),
            ),
            SizedBox(width: 10,),
            WidgetHelper.getFieldSeparator(),

          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5),),
                border: Border.all(color:AppColor.appDivider, width: 2),
              ),
              child: Text("XXL",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),),
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
