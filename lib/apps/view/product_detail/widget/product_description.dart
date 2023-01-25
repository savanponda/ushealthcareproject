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

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "AppSemiBold",
            color: Colors.black,
          ),
        ),

        WidgetHelper.getFieldSeparator(),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, lacus. Iaculis eu egestas leo egestas vel. Ultrices ut magna nulla facilisi commodo enim, orci feugiat pharetra. Id sagittis, ullamcorper turpis ultrices platea pharetra.",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "AppRegular",
            color: Colors.black,
          ),
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    ));
  }
}
